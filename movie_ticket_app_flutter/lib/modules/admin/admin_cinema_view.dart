import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'admin_cinema_controller.dart';

class AdminCinemaView extends GetView<AdminCinemaController> {
  const AdminCinemaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quản lý rạp')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.goToCreateOrEdit(),
        child: const Icon(Icons.add),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.cinemas.isEmpty) {
          return const Center(child: Text('Chưa có rạp nào'));
        }
        return ListView.builder(
          itemCount: controller.cinemas.length,
          itemBuilder: (context, index) {
            final cinema = controller.cinemas[index];
            return ListTile(
              leading: const Icon(Icons.theaters),
              title: Text(cinema.name),
              subtitle: Text(cinema.address),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => controller.goToCreateOrEdit(cinema: cinema),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => controller.deleteCinema(cinema.id!),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}