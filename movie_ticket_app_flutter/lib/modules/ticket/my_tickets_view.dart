import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'my_tickets_controller.dart';

class MyTicketsView extends GetView<MyTicketsController> {
  const MyTicketsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vé của tôi')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.orders.isEmpty) {
          return const Center(child: Text('Bạn chưa có vé nào'));
        }

        return ListView.builder(
          itemCount: controller.orders.length,
          itemBuilder: (context, index) {
            final order = controller.orders[index];
            return ListTile(
              leading: const Icon(Icons.confirmation_number),
              title: Text('Đơn hàng #${order.id}'),
              subtitle: Text('${order.totalPrice.toStringAsFixed(0)}đ - ${order.status}'),
              onTap: () => controller.viewTicket(order.id!),
            );
          },
        );
      }),
    );
  }
}