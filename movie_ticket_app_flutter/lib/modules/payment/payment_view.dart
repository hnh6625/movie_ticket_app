import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thanh toán')),
      body: Obx(() {
        if (controller.isProcessing.value) {
          return const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Đang xử lý thanh toán...'),
              ],
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Số tiền cần thanh toán',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                '${controller.totalPrice.toStringAsFixed(0)}đ',
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              QrImageView(
                data: controller.qrData.value,
                size: 220,
              ),
              const SizedBox(height: 16),
              const Text(
                'Quét mã QR bằng ứng dụng ngân hàng/ví điện tử để thanh toán',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              if (controller.errorMessage.value != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    controller.errorMessage.value!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              ElevatedButton(
                onPressed: controller.confirmPayment,
                child: const Text('Tôi đã thanh toán'),
              ),
            ],
          ),
        );
      }),
    );
  }
}