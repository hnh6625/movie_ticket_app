import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'movie_detail_controller.dart';

class MovieDetailView extends GetView<MovieDetailController> {
  const MovieDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chi tiết phim')),
      body: Obx(() {
        if (controller.isLoading.value || controller.movie.value == null) {
          return const Center(child: CircularProgressIndicator());
        }
        final movie = controller.movie.value!;
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (controller.youtubeController != null)
              YoutubePlayer(
                controller: controller.youtubeController!,
                aspectRatio: 16 / 9,
              ),
            const SizedBox(height: 16),
            Text(movie.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 18),
                Text(' ${movie.avgRating.toStringAsFixed(1)}  •  ${movie.genre}  •  ${movie.durationMinutes} phút'),
              ],
            ),
            const SizedBox(height: 12),
            Text(movie.description),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.goToCinemaShowtime,
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
                child: const Text('Đặt vé'),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: controller.goToReview,
                style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
                child: const Text('Xem đánh giá'),
              ),
            ),
          ],
        );
      }),
    );
  }
}