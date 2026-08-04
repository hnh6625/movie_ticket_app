import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import '../../data/services/api_client.dart';
import '../../shared/theme/app_colors.dart';
import '../../routes/app_routes.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.local_movies_rounded, color: Colors.white, size: 32),
              ),
              const SizedBox(height: 20),
              const Text(
                'Movie Ticket App',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Đăng nhập hoặc tạo tài khoản mới để đặt vé',
                style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
              ),
              const SizedBox(height: 32),

              // Widget dựng sẵn của Serverpod — tự hiện Login/Register/Forgot
              // Password + nút Google (chỉ hiện provider nào server đã bật).
              Theme(
                data: Theme.of(context).copyWith(
                  brightness: Brightness.dark,
                  colorScheme: Theme.of(context).colorScheme.copyWith(
                    primary: AppColors.primary,
                    error: AppColors.error,
                  ),
                ),
                child: SignInWidget(
                  client: client,
                  onAuthenticated: () {
                    Get.offAllNamed(Routes.home);
                  },
                  onError: (error) {
                    Get.snackbar(
                      'Lỗi đăng nhập',
                      error.toString(),
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.redAccent,
                      colorText: Colors.white,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}