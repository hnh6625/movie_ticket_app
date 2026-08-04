import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_ticket_app_client/movie_ticket_app_client.dart';
import '../../core/base_controller.dart';
import '../../data/services/api_client.dart';
import '../../routes/app_routes.dart';

class AdminMovieController extends BaseController {
  final RxList<Movie> movies = <Movie>[].obs;

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
      await _fetchAllMovies();
    });
  }

  Future<void> fetchAllMovies() async {
    await runSafely(() => _fetchAllMovies());
  }

  Future<void> _fetchAllMovies() async {
    final result = await client.movie.getAll();
    movies.assignAll(result);
  }

  Future<void> deleteMovie(int movieId) async {
    final confirmed = await Get.dialog<bool>(AlertDialog(
      title: const Text('Xác nhận'),
      content: const Text('Xóa phim này? Hành động không thể hoàn tác.'),
      actions: [
        TextButton(onPressed: () => Get.back(result: false), child: const Text('Hủy')),
        TextButton(onPressed: () => Get.back(result: true), child: const Text('Xóa')),
      ],
    ));
    if (confirmed != true) return;

    await runSafely(() async {
      final success = await client.adminMovie.delete(movieId);
      if (!success) {
        errorMessage.value = 'Xóa thất bại (không đủ quyền hoặc phim không tồn tại).';
        return;
      }
      movies.removeWhere((m) => m.id == movieId);
      Get.snackbar('Thành công', 'Đã xóa phim');
    });
  }

  Future<void> goToCreateOrEdit({Movie? movie}) async {
    final result = await Get.toNamed(Routes.adminMovieForm, arguments: movie);
    if (result == true) fetchAllMovies(); // form báo về đã lưu -> load lại danh sách
  }

  void goToShowtimes(int movieId) {
    Get.toNamed(Routes.adminShowtime, arguments: movieId);
  }
}