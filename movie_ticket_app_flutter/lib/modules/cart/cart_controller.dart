import 'package:get/get.dart';
import 'package:movie_ticket_app_client/movie_ticket_app_client.dart';

import '../../core/base_controller.dart';
import '../../data/services/api_client.dart';

class CartController extends BaseController {
  late final int showtimeId;
  late final List<int> showtimeSeatIds;
  late final Map<int, int> concessionQuantities;

  final showtime = Rxn<Showtime>();
  final seatLabels = <String>[].obs;
  final concessionItems = <Concession>[].obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>;
    showtimeId = args['showtimeId'] as int;
    showtimeSeatIds = List<int>.from(args['showtimeSeatIds'] as List);
    concessionQuantities = Map<int, int>.from(args['concessionQuantities'] as Map);
    _loadSummary();
  }

  Future<void> _loadSummary() async {
    await runSafely(() async {
      final st = await client.showtime.getById(showtimeId);
      showtime.value = st;

      // Lấy tên ghế để hiển thị (ví dụ "A1, A2")
      final showtimeSeats = await client.showtime.getSeats(showtimeId);
      final room = await client.cinema.getRoomWithSeats(st!.roomId);
      final seatById = {for (final s in room?.seats ?? <Seat>[]) s.id: s};

      final labels = <String>[];
      for (final ssId in showtimeSeatIds) {
        final ss = showtimeSeats.firstWhereOrNull((s) => s.id == ssId);
        if (ss != null && seatById.containsKey(ss.seatId)) {
          final seat = seatById[ss.seatId]!;
          labels.add('${seat.rowLabel}${seat.seatNumber}');
        }
      }
      seatLabels.assignAll(labels);

      // Lấy thông tin combo đã chọn
      final allConcessions = await client.concession.getAll();
      concessionItems.assignAll(
        allConcessions.where((c) => concessionQuantities.containsKey(c.id)),
      );
    });
  }

  double get seatsTotal {
    if (showtime.value == null) return 0;
    // Ước lượng đơn giản: hiển thị theo basePrice, giá chính xác backend sẽ tính lại khi tạo Order
    return showtime.value!.basePrice * showtimeSeatIds.length;
  }

  double get concessionsTotal {
    double total = 0;
    for (final c in concessionItems) {
      total += c.price * (concessionQuantities[c.id] ?? 0);
    }
    return total;
  }

  double get grandTotal => seatsTotal + concessionsTotal;

  void goToPayment() {
    Get.toNamed('/payment', arguments: {
      'showtimeId': showtimeId,
      'showtimeSeatIds': showtimeSeatIds,
      'concessionQuantities': concessionQuantities,
      'totalPrice': grandTotal,
    });
  }
}