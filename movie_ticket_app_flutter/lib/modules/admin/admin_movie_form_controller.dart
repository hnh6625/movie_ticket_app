import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_ticket_app_client/movie_ticket_app_client.dart';
import '../../core/base_controller.dart';
import '../../data/services/api_client.dart';

class AdminMovieFormController extends BaseController {
  Movie? editingMovie; // null = tạo mới, khác null = sửa

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final posterUrlController = TextEditingController();
  final trailerYoutubeIdController = TextEditingController();
  final genreController = TextEditingController();
  final durationController = TextEditingController();

  final Rx<DateTime> releaseDate = DateTime.now().obs;
  final RxString status = 'COMING_SOON'.obs;

  bool get isEditing => editingMovie != null;

  @override
  void onInit() {
    super.onInit();
    editingMovie = Get.arguments as Movie?;
    final m = editingMovie;
    if (m != null) {
      titleController.text = m.title;
      descriptionController.text = m.description;
      posterUrlController.text = m.posterUrl;
      trailerYoutubeIdController.text = m.trailerYoutubeId;
      genreController.text = m.genre;
      durationController.text = m.durationMinutes.toString();
      releaseDate.value = m.releaseDate;
      status.value = m.status;
    }
  }

  Future<void> pickReleaseDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: releaseDate.value,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) releaseDate.value = picked;
  }

  Future<void> submit() async {
    if (titleController.text.trim().isEmpty) {
      errorMessage.value = 'Vui lòng nhập tên phim';
      return;
    }
    final duration = int.tryParse(durationController.text.trim());
    if (duration == null || duration <= 0) {
      errorMessage.value = 'Thời lượng phim không hợp lệ';
      return;
    }

    await runSafely(() async {
      final movieData = Movie(
        id: editingMovie?.id,
        title: titleController.text.trim(),
        description: descriptionController.text.trim(),
        posterUrl: posterUrlController.text.trim(),
        trailerYoutubeId: trailerYoutubeIdController.text.trim(),
        genre: genreController.text.trim(),
        durationMinutes: duration,
        releaseDate: releaseDate.value,
        status: status.value,
        // avgRating do hệ thống review tự tính, admin không sửa tay
        avgRating: editingMovie?.avgRating ?? 0.0,
        createdAt: editingMovie?.createdAt ?? DateTime.now(),
      );

      final result = isEditing
          ? await client.adminMovie.update(movieData)
          : await client.adminMovie.create(movieData);

      if (result == null) {
        errorMessage.value = 'Bạn không có quyền thực hiện thao tác này.';
        return;
      }

      Get.back(result: true); // báo cho AdminMovieController biết để refresh
      Get.snackbar('Thành công', isEditing ? 'Đã cập nhật phim' : 'Đã thêm phim mới');
    });
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    posterUrlController.dispose();
    trailerYoutubeIdController.dispose();
    genreController.dispose();
    durationController.dispose();
    super.onClose();
  }
}