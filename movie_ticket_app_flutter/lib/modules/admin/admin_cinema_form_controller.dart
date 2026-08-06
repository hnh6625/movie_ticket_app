import 'package:get/get.dart';
import 'package:movie_ticket_app_client/movie_ticket_app_client.dart';
import '../../core/base_controller.dart';
import '../../data/services/api_client.dart';
import 'package:flutter/material.dart';

class AdminCinemaFormController extends BaseController {
  Cinema? editingCinema; // null = tạo mới, khác null = sửa

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final latitudeController = TextEditingController();
  final longitudeController = TextEditingController();

  bool get isEditing => editingCinema != null;

  @override
  void onInit() {
    super.onInit();
    editingCinema = Get.arguments as Cinema?;
    final c = editingCinema;
    if (c != null) {
      nameController.text = c.name;
      addressController.text = c.address;
      latitudeController.text = c.latitude.toString();
      longitudeController.text = c.longitude.toString();
    }
  }

  Future<void> submit() async {
    if (nameController.text.trim().isEmpty) {
      errorMessage.value = 'Vui lòng nhập tên rạp';
      return;
    }
    if (addressController.text.trim().isEmpty) {
      errorMessage.value = 'Vui lòng nhập địa chỉ rạp';
      return;
    }
    final lat = double.tryParse(latitudeController.text.trim());
    final lng = double.tryParse(longitudeController.text.trim());
    if (lat == null || lng == null) {
      errorMessage.value = 'Vĩ độ/kinh độ không hợp lệ (ví dụ: 10.7769)';
      return;
    }

    await runSafely(() async {
      final cinemaData = Cinema(
        id: editingCinema?.id,
        name: nameController.text.trim(),
        address: addressController.text.trim(),
        latitude: lat,
        longitude: lng,
      );

      final result = isEditing
          ? await client.adminCinema.updateCinema(cinemaData)
          : await client.adminCinema.createCinema(cinemaData);

      if (result == null) {
        errorMessage.value = 'Bạn không có quyền thực hiện thao tác này.';
        return;
      }

      Get.back(result: true);
      Get.snackbar('Thành công', isEditing ? 'Đã cập nhật rạp' : 'Đã thêm rạp mới');
    });
  }

  @override
  void onClose() {
    nameController.dispose();
    addressController.dispose();
    latitudeController.dispose();
    longitudeController.dispose();
    super.onClose();
  }
}