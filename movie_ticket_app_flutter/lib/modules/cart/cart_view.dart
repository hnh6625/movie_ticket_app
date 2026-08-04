import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Xác nhận đơn hàng')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.errorMessage.value != null) {
          return Center(child: Text(controller.errorMessage.value!));
        }

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('Suất chiếu: ${controller.showtime.value?.startTime}'),
            const SizedBox(height: 8),
            Text('Ghế: ${controller.seatLabels.join(", ")}'),
            Text('Tiền ghế: ${controller.seatsTotal.toStringAsFixed(0)}đ'),
            const Divider(height: 32),
            const Text('Combo bắp nước:', style: TextStyle(fontWeight: FontWeight.bold)),
            ...controller.concessionItems.map((c) {
              final qty = controller.concessionQuantities[c.id] ?? 0;
              return ListTile(
                title: Text(c.name),
                trailing: Text('x$qty  -  ${(c.price * qty).toStringAsFixed(0)}đ'),
              );
            }),
            const Divider(height: 32),
            Text(
              'Tổng cộng: ${controller.grandTotal.toStringAsFixed(0)}đ',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        );
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: controller.goToPayment,
          child: const Text('Tiến hành thanh toán'),
        ),
      ),
    );
  }
}