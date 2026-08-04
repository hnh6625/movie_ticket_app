import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'admin_movie_controller.dart';

class AdminMovieView extends GetView<AdminMovieController> {
  const AdminMovieView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quản lý phim')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.goToCreateOrEdit(),
        child: const Icon(Icons.add),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.movies.length,
          itemBuilder: (context, index) {
            final movie = controller.movies[index];
            return ListTile(
              leading: Image.network(
                movie.posterUrl,
                width: 40,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 40,
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.movie, size: 20, color: Colors.grey),
                ),
              ),
              title: Text(movie.title),
              subtitle: Text('${movie.status} • ${movie.genre}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.schedule),
                    onPressed: () => controller.goToShowtimes(movie.id!),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => controller.goToCreateOrEdit(movie: movie),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => controller.deleteMovie(movie.id!),
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