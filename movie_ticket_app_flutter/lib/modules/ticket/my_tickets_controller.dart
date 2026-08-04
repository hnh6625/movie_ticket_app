import 'package:get/get.dart';
import 'package:movie_ticket_app_client/movie_ticket_app_client.dart';

import '../../core/base_controller.dart';
import '../../data/services/api_client.dart';

class MyTicketsController extends BaseController {
  final orders = <Order>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchMyOrders();
  }

  Future<void> fetchMyOrders() async {
    await runSafely(() async {
      final result = await client.order.getMyOrders();
      orders.assignAll(result);
    });
  }

  void viewTicket(int orderId) {
    Get.toNamed('/ticket', arguments: {'orderId': orderId});
  }
}