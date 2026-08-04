import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'ticket_controller.dart';

class TicketView extends GetView<TicketController> {
  const TicketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vé điện tử'),
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.errorMessage.value != null) {
          return Center(child: Text(controller.errorMessage.value!));
        }

        final order = controller.order.value;
        if (order == null) {
          return const Center(child: Text('Không tìm thấy vé'));
        }

        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 64),
              const SizedBox(height: 16),
              const Text(
                'Đặt vé thành công!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              QrImageView(
                data: order.qrCodeData ?? 'TICKET-${order.id}',
                size: 200,
              ),
              const SizedBox(height: 16),
              Text('Mã vé: ${order.qrCodeData}'),
              Text('Tổng tiền: ${order.totalPrice.toStringAsFixed(0)}đ'),
              Text('Trạng thái: ${order.status}'),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: controller.backToHome,
                child: const Text('Về trang chủ'),
              ),
            ],
          ),
        );
      }),
    );
  }
}