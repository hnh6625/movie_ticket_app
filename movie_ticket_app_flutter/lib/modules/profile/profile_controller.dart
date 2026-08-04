import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/base_controller.dart';
import '../../data/services/api_client.dart';
import '../../routes/app_routes.dart';

/// Profile thật — gọi client.userProfile.getMe()/updateMe() (endpoint A đã viết sẵn).
class ProfileController extends BaseController {
  final formKey = GlobalKey<FormState>();
  final nameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final emailCtrl = TextEditingController();

  final isEditing = false.obs;
  final avatarUrl = RxnString();
  final _hasExistingProfile = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadProfile();
  }

  @override
  void onClose() {
    nameCtrl.dispose();
    phoneCtrl.dispose();
    emailCtrl.dispose();
    super.onClose();
  }

  Future<void> _loadProfile() async {
    await runSafely(() async {
      final profile = await client.userProfile.getMe();
      if (profile == null) {
        // Lần đầu đăng nhập, chưa có hồ sơ — cho user tự điền rồi Lưu.
        _hasExistingProfile.value = false;
        isEditing.value = true;
        return;
      }
      _hasExistingProfile.value = true;
      nameCtrl.text = profile.name;
      phoneCtrl.text = profile.phone ?? '';
      emailCtrl.text = profile.email;
      avatarUrl.value = profile.avatarUrl;
    });
  }

  void toggleEdit() => isEditing.value = !isEditing.value;

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) return 'Vui lòng nhập họ tên';
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return 'Vui lòng nhập email';
    final regex = RegExp(r'^[\w\.\-]+@([\w\-]+\.)+[\w\-]{2,4}$');
    if (!regex.hasMatch(value.trim())) return 'Email không hợp lệ';
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) return null; // phone optional
    final regex = RegExp(r'^[0-9]{9,11}$');
    if (!regex.hasMatch(value.trim())) return 'Số điện thoại không hợp lệ';
    return null;
  }

  Future<void> saveProfile() async {
    if (!formKey.currentState!.validate()) return;

    await runSafely(() async {
      final updated = await client.userProfile.updateMe(
        name: nameCtrl.text.trim(),
        email: emailCtrl.text.trim(),
        phone: phoneCtrl.text.trim().isEmpty ? null : phoneCtrl.text.trim(),
        avatarUrl: avatarUrl.value,
      );
      nameCtrl.text = updated.name;
      phoneCtrl.text = updated.phone ?? '';
      emailCtrl.text = updated.email;
      _hasExistingProfile.value = true;
      isEditing.value = false;
      Get.snackbar('Thành công', 'Đã cập nhật thông tin',
          snackPosition: SnackPosition.BOTTOM);
    });
  }

  Future<void> changeAvatar() async {
    // TODO: chưa có endpoint upload ảnh lên server — hiện tại chỉ lưu path
    // ảnh local. Khi A làm endpoint upload (cloud storage), thay đoạn này
    // bằng: upload file → lấy URL trả về → gán vào avatarUrl.
    try {
      final picker = ImagePicker();
      final picked = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        imageQuality: 80,
      );
      if (picked == null) return;
      avatarUrl.value = picked.path;
    } catch (e) {
      Get.snackbar('Lỗi', 'Không chọn được ảnh, thử lại nhé',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void logout() {
    Get.defaultDialog(
      title: 'Đăng xuất',
      middleText: 'Bạn có chắc muốn đăng xuất?',
      textConfirm: 'Đăng xuất',
      textCancel: 'Hủy',
      confirmTextColor: Colors.white,
      onConfirm: () async {
        Get.back();

        await authSessionManager.signOutDevice();

        Get.offAllNamed(Routes.login);
      },
    );
  }
}