import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/theme/app_colors.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_text_field.dart';
import 'profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text('Trang cá nhân', style: TextStyle(color: AppColors.textPrimary)),
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        actions: [
          Obx(() => TextButton(
            onPressed: controller.toggleEdit,
            child: Text(
              controller.isEditing.value ? 'Hủy' : 'Sửa',
              style: const TextStyle(color: AppColors.primary),
            ),
          )),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                const SizedBox(height: 16),
                _buildAvatar(),
                const SizedBox(height: 32),

                AppTextField(
                  controller: controller.nameCtrl,
                  label: 'Họ và tên',
                  prefixIcon: Icons.person_outline,
                  validator: controller.validateName,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: controller.phoneCtrl,
                  label: 'Số điện thoại',
                  keyboardType: TextInputType.phone,
                  prefixIcon: Icons.phone_outlined,
                  validator: controller.validatePhone,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: controller.emailCtrl,
                  label: 'Email',
                  prefixIcon: Icons.email_outlined,
                ),

                const SizedBox(height: 28),
                Obx(() => controller.isEditing.value
                    ? AppButton(
                  label: 'Lưu thay đổi',
                  isLoading: controller.isLoading.value,
                  onPressed: controller.saveProfile,
                )
                    : const SizedBox.shrink()),

                const SizedBox(height: 40),
                AppButton(
                  label: 'Đăng xuất',
                  outlined: true,
                  icon: Icons.logout_rounded,
                  onPressed: controller.logout,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return Center(
      child: Stack(
        children: [
          Obx(() {
            final url = controller.avatarUrl.value;
            ImageProvider? image;
            if (url != null && url.isNotEmpty) {
              image = url.startsWith('http') ? NetworkImage(url) : FileImage(File(url));
            }
            return CircleAvatar(
              radius: 48,
              backgroundColor: AppColors.surfaceLight,
              backgroundImage: image,
              child: image == null
                  ? const Icon(Icons.person, size: 48, color: AppColors.textSecondary)
                  : null,
            );
          }),
          Positioned(
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: controller.changeAvatar,
              child: Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.camera_alt_rounded, color: Colors.white, size: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}