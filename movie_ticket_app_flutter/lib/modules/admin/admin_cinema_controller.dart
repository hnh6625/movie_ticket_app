import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_ticket_app_client/movie_ticket_app_client.dart';
import '../../core/base_controller.dart';
import '../../data/services/api_client.dart';
import '../../routes/app_routes.dart';

class AdminCinemaController extends BaseController {
  final RxList<Cinema> cinemas = <Cinema>[].obs;

  @override
  void onInit() {
    super.onInit();
    _checkAdminThenLoad();
  }

  Future<void> _checkAdminThenLoad() async {
    await runSafely(() async {
      final me = await client.userProfile.getMe();
      if (me == null || me.role != 'ADMIN') {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.offNamed(Routes.home);
          Get.snackbar('Không có quyền truy cập', 'Chỉ tài khoản Admin mới vào được màn này.');
        });
        return;
      }
      await _fetchAllCinemas();
    });
  }

  Future<void> fetchAllCinemas() async {
    await runSafely(() => _fetchAllCinemas());
  }

  Future<void> _fetchAllCinemas() async {
    final result = await client.cinema.getAll();
    cinemas.assignAll(result);
  }

  Future<void> deleteCinema(int cinemaId) async {
    final confirmed = await Get.dialog<bool>(AlertDialog(
      title: const Text('Xác nhận'),
      content: const Text(
          'Xóa rạp này? Các phòng/ghế/suất chiếu liên quan có thể bị lỗi tham chiếu nếu chưa xóa hết trước.'),
      actions: [
        TextButton(onPressed: () => Get.back(result: false), child: const Text('Hủy')),
        TextButton(onPressed: () => Get.back(result: true), child: const Text('Xóa')),
      ],
    ));
    if (confirmed != true) return;

    await runSafely(() async {
      final success = await client.adminCinema.deleteCinema(cinemaId);
      if (!success) {
        errorMessage.value = 'Xóa thất bại (không đủ quyền hoặc rạp không tồn tại).';
        return;
      }
      cinemas.removeWhere((c) => c.id == cinemaId);
      Get.snackbar('Thành công', 'Đã xóa rạp');
    });
  }

  Future<void> goToCreateOrEdit({Cinema? cinema}) async {
    final result = await Get.toNamed(Routes.adminCinemaForm, arguments: cinema);
    if (result == true) fetchAllCinemas();
  }
}