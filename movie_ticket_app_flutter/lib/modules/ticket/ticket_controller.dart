import 'package:get/get.dart';
import 'package:movie_ticket_app_client/movie_ticket_app_client.dart';

import '../../core/base_controller.dart';
import '../../data/services/api_client.dart';

class TicketController extends BaseController {
  late final int orderId;
  final order = Rxn<Order>();

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>;
    orderId = args['orderId'] as int;
    _loadOrder();
  }

  Future<void> _loadOrder() async {
    await runSafely(() async {
      final result = await client.order.getById(orderId);
      order.value = result;
    });
  }

  void backToHome() {
    Get.offAllNamed('/home');
  }
}