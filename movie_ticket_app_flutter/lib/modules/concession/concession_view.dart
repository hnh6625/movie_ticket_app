import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'concession_controller.dart';

class ConcessionView extends GetView<ConcessionController> {
  const ConcessionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chọn bắp nước')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.errorMessage.value != null) {
          return Center(child: Text(controller.errorMessage.value!));
        }

        return ListView.builder(
          itemCount: controller.concessions.length,
          itemBuilder: (context, index) {
            final item = controller.concessions[index];
            return Obx(() {
              final qty = controller.quantities[item.id] ?? 0;
              return ListTile(
                title: Text(item.name),
                subtitle: Text('${item.price.toStringAsFixed(0)}đ'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: () => controller.decrement(item.id!),
                    ),
                    Text('$qty'),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline),
                      onPressed: () => controller.increment(item.id!),
                    ),
                  ],
                ),
              );
            });
          },
        );
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: controller.goToCart,
          child: Obx(() => Text('Tiếp tục (${controller.concessionsTotal.toStringAsFixed(0)}đ)')),
        ),
      ),
    );
  }
}