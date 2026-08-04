import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'admin_showtime_controller.dart';

class AdminShowtimeView extends GetView<AdminShowtimeController> {
  const AdminShowtimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quản lý suất chiếu')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.resetForm();
          _showCreateDialog(context);
        },
        child: const Icon(Icons.add),
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.showtimes.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.showtimes.isEmpty) {
          return const Center(child: Text('Chưa có suất chiếu nào cho phim này'));
        }
        return ListView.builder(
          itemCount: controller.showtimes.length,
          itemBuilder: (context, index) {
            final s = controller.showtimes[index];
            final info = controller.findCinemaRoom(s.roomId);
            final title = info != null ? '${info.cinema.name} • ${info.room.name}' : 'Phòng #${s.roomId}';
            return ListTile(
              title: Text(title),
              subtitle: Text(
                '${DateFormat('dd/MM/yyyy HH:mm').format(s.startTime)}  •  '
                    '${NumberFormat.decimalPattern('vi').format(s.basePrice)}đ',
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => controller.deleteShowtime(s.id!),
              ),
            );
          },
        );
      }),
    );
  }

  void _showCreateDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: const Text('Thêm suất chiếu mới'),
        content: Obx(() => SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (controller.errorMessage.value != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(controller.errorMessage.value!, style: const TextStyle(color: Colors.red)),
                ),
              DropdownButtonFormField<int>(
                initialValue: controller.formCinema.value?.id,
                decoration: const InputDecoration(labelText: 'Rạp'),
                items: controller.cinemas
                    .map((c) => DropdownMenuItem(value: c.id, child: Text(c.name)))
                    .toList(),
                onChanged: (id) {
                  final c = controller.cinemas.firstWhere((c) => c.id == id);
                  controller.onFormCinemaChanged(c);
                },
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<int>(
                initialValue: controller.formRoom.value?.id,
                decoration: const InputDecoration(labelText: 'Phòng chiếu'),
                items: (controller.formCinema.value?.rooms ?? [])
                    .map((r) => DropdownMenuItem(value: r.id, child: Text('${r.name} (${r.roomType})')))
                    .toList(),
                onChanged: (id) {
                  final rooms = controller.formCinema.value?.rooms ?? [];
                  final r = rooms.firstWhere((r) => r.id == id);
                  controller.formRoom.value = r;
                },
              ),
              const SizedBox(height: 8),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Giờ chiếu'),
                subtitle: Text(DateFormat('dd/MM/yyyy HH:mm').format(controller.formDateTime.value)),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => controller.pickFormDateTime(context),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: controller.priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Giá vé (VNĐ)'),
              ),
            ],
          ),
        )),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Hủy')),
          Obx(() => ElevatedButton(
            onPressed: controller.isLoading.value ? null : controller.submitCreateForm,
            child: controller.isLoading.value
                ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                : const Text('Thêm'),
          )),
        ],
      ),
    );
  }
}