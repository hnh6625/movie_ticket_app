import 'package:get/get.dart';

/// Base class cho mọi Controller trong app.
/// Cung cấp sẵn: trạng thái loading, thông báo lỗi, và hàm gọi API an toàn.
abstract class BaseController extends GetxController {
  final isLoading = false.obs;
  final errorMessage = RxnString();

  /// Bọc quanh mọi lời gọi API để tự động xử lý loading + bắt lỗi.
  Future<void> runSafely(Future<void> Function() action) async {
    try {
      isLoading.value = true;
      errorMessage.value = null;
      await action();
    } catch (e) {
      errorMessage.value = _friendlyError(e);
    } finally {
      isLoading.value = false;
    }
  }

  /// Chuyển lỗi kỹ thuật thành thông báo dễ hiểu cho người dùng.
  /// Mỗi module có thể override lại hàm này nếu cần thông báo riêng.
  String _friendlyError(Object e) {
    final msg = e.toString();
    if (msg.contains('SocketException') || msg.contains('Connection')) {
      return 'Không thể kết nối tới máy chủ. Vui lòng kiểm tra mạng.';
    }
    return 'Đã có lỗi xảy ra, vui lòng thử lại.';
  }
}