import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AppButton extends StatelessWidget {
  final String? text; // Đổi thành nullable
  final String? label; // Đã thêm
  final VoidCallback? onPressed;
  final bool isLoading;
  final IconData? icon;
  final bool outlined; // Đã thêm

  const AppButton({
    super.key,
    this.text, // Không bắt buộc nữa
    this.label, // Đã thêm
    this.onPressed,
    this.isLoading = false,
    this.icon,
    this.outlined = false, // Đã thêm (Mặc định false)
  });

  @override
  Widget build(BuildContext context) {
    // Lấy 'text', nếu null thì lấy 'label', nếu cả 2 null thì rỗng
    final String displayText = text ?? label ?? '';

    // Widget chứa nội dung bên trong Button (Text + Icon + Loading)
    final Widget buttonContent = isLoading
        ? SizedBox(
      width: 22,
      height: 22,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: outlined ? AppColors.primary : Colors.white, // Đổi màu loading theo style
      ),
    )
        : Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[
          Icon(icon),
          const SizedBox(width: 8),
        ],
        Text(
          displayText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: outlined
          ? OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: buttonContent,
      )
          : ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: buttonContent,
      ),
    );
  }
}