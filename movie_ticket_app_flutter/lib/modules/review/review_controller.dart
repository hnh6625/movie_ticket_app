import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_ticket_app_client/movie_ticket_app_client.dart';
import '../../core/base_controller.dart';
import '../../data/services/api_client.dart';

class ReviewController extends BaseController {
  late final int movieId;
  final RxList<Review> reviews = <Review>[].obs;
  final RxDouble myRating = 5.0.obs;
  final myCommentController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    movieId = Get.arguments as int;
    fetchReviews();
  }

  Future<void> fetchReviews() async {
    await runSafely(() async {
      final result = await client.review.getByMovie(movieId);
      reviews.assignAll(result);
    });
  }

  Future<void> submitReview() async {
    await runSafely(() async {
      final result = await client.review.create(
        movieId: movieId,
        rating: myRating.value.round(),
        comment: myCommentController.text.trim(),
      );

      if (!result.success) {
        errorMessage.value = result.message ?? 'Không thể gửi đánh giá';
        return;
      }

      Get.snackbar('Thành công', 'Cảm ơn bạn đã đánh giá phim!');
      myCommentController.clear();
      final updated = await client.review.getByMovie(movieId);
      reviews.assignAll(updated);
    });
  }

  @override
  void onClose() {
    myCommentController.dispose();
    super.onClose();
  }
}