import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'admin_cinema_form_controller.dart';

class AdminCinemaFormView extends GetView<AdminCinemaFormController> {
  const AdminCinemaFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.isEditing ? 'Sửa rạp' : 'Thêm rạp mới')),
      ),
      body: Obx(() => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: controller.nameController,
              decoration: const InputDecoration(labelText: 'Tên rạp'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller.addressController,
              decoration: const InputDecoration(labelText: 'Địa chỉ'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller.latitudeController,
              decoration: const InputDecoration(labelText: 'Vĩ độ (latitude)'),
              keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller.longitudeController,
              decoration: const InputDecoration(labelText: 'Kinh độ (longitude)'),
              keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
            ),
            const SizedBox(height: 16),
            if (controller.errorMessage.value != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  controller.errorMessage.value!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ElevatedButton(
              onPressed: controller.isLoading.value ? null : controller.submit,
              child: controller.isLoading.value
                  ? const SizedBox(
                  width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                  : const Text('Lưu'),
            ),
          ],
        ),
      )),
    );
  }
}