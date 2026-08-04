import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'admin_movie_form_controller.dart';

class AdminMovieFormView extends GetView<AdminMovieFormController> {
  const AdminMovieFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Obx(() => Text(controller.isEditing ? 'Sửa phim' : 'Thêm phim mới'))),
      body: Obx(() => ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (controller.errorMessage.value != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(controller.errorMessage.value!, style: const TextStyle(color: Colors.red)),
            ),
          TextField(
            controller: controller.titleController,
            decoration: const InputDecoration(labelText: 'Tên phim', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: controller.descriptionController,
            decoration: const InputDecoration(labelText: 'Mô tả', border: OutlineInputBorder()),
            maxLines: 3,
          ),
          const SizedBox(height: 12),
          TextField(
            controller: controller.posterUrlController,
            decoration: const InputDecoration(labelText: 'URL poster', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: controller.trailerYoutubeIdController,
            decoration: const InputDecoration(
              labelText: 'YouTube Video ID',
              helperText: 'Chỉ ID, vd: dQw4w9WgXcQ (không phải cả URL)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: controller.genreController,
            decoration: const InputDecoration(labelText: 'Thể loại', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: controller.durationController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Thời lượng (phút)', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 12),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Ngày công chiếu'),
            subtitle: Text(DateFormat('dd/MM/yyyy').format(controller.releaseDate.value)),
            trailing: const Icon(Icons.calendar_today),
            onTap: () => controller.pickReleaseDate(context),
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            initialValue: controller.status.value,
            decoration: const InputDecoration(labelText: 'Trạng thái', border: OutlineInputBorder()),
            items: const [
              DropdownMenuItem(value: 'SHOWING', child: Text('Đang chiếu')),
              DropdownMenuItem(value: 'COMING_SOON', child: Text('Sắp chiếu')),
            ],
            onChanged: (v) => controller.status.value = v ?? controller.status.value,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: controller.isLoading.value ? null : controller.submit,
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
              child: controller.isLoading.value
                  ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                  : Text(controller.isEditing ? 'Lưu thay đổi' : 'Thêm phim'),
            ),
          ),
        ],
      )),
    );
  }
}