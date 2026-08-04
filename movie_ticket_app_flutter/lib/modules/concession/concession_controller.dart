import 'package:get/get.dart';
import 'package:movie_ticket_app_client/movie_ticket_app_client.dart';

import '../../core/base_controller.dart';
import '../../data/services/api_client.dart';

class ConcessionController extends BaseController {
  late final int showtimeId;
  late final List<int> showtimeSeatIds;

  final concessions = <Concession>[].obs;
  final quantities = <int, int>{}.obs; // concessionId -> quantity

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>;
    showtimeId = args['showtimeId'] as int;
    showtimeSeatIds = List<int>.from(args['showtimeSeatIds'] as List);
    _fetchConcessions();
  }

  Future<void> _fetchConcessions() async {
    await runSafely(() async {
      final result = await client.concession.getAll();
      concessions.assignAll(result);
    });
  }

  void increment(int concessionId) {
    quantities[concessionId] = (quantities[concessionId] ?? 0) + 1;
    quantities.refresh();
  }

  void decrement(int concessionId) {
    final current = quantities[concessionId] ?? 0;
    if (current > 0) {
      quantities[concessionId] = current - 1;
      quantities.refresh();
    }
  }

  double get concessionsTotal {
    double total = 0;
    for (final c in concessions) {
      final qty = quantities[c.id] ?? 0;
      total += c.price * qty;
    }
    return total;
  }

  void goToCart() {
    final selectedConcessions = <int, int>{
      for (final entry in quantities.entries)
        if (entry.value > 0) entry.key: entry.value,
    };

    Get.toNamed('/cart', arguments: {
      'showtimeId': showtimeId,
      'showtimeSeatIds': showtimeSeatIds,
      'concessionQuantities': selectedConcessions,
    });
  }
}