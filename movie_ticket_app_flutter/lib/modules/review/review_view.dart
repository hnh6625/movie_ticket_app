import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'review_controller.dart';

class ReviewView extends GetView<ReviewController> {
  const ReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Đánh giá phim')),
      body: Obx(() {
        if (controller.isLoading.value && controller.reviews.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text('Đánh giá của bạn', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (i) {
                final starValue = i + 1;
                return IconButton(
                  onPressed: () => controller.myRating.value = starValue.toDouble(),
                  icon: Icon(
                    starValue <= controller.myRating.value ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                    size: 36,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                );
              }),
            ),
            const SizedBox(height: 4),
            Center(
              child: Text(
                '${controller.myRating.value.round()}/5 sao',
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.myCommentController,
              decoration: const InputDecoration(
                hintText: 'Chia sẻ cảm nhận của bạn...',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 8),
            if (controller.errorMessage.value != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(controller.errorMessage.value!, style: const TextStyle(color: Colors.red)),
              ),
            ElevatedButton(
              onPressed: controller.isLoading.value ? null : controller.submitReview,
              child: const Text('Gửi đánh giá'),
            ),
            const Divider(height: 32),
            const Text('Tất cả đánh giá', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...controller.reviews.map((r) => Card(
              child: ListTile(
                title: Row(children: List.generate(5, (i) => Icon(
                    i < r.rating ? Icons.star : Icons.star_border,
                    color: Colors.amber, size: 16))),
                subtitle: Text(r.comment),
              ),
            )),
          ],
        );
      }),
    );
  }
}