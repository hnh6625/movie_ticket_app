import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';
import '../../routes/app_routes.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang chủ'),
        actions: [
          IconButton(
            icon: const Icon(Icons.confirmation_number_outlined),
            tooltip: 'Vé của tôi',
            onPressed: () => Get.toNamed(Routes.myTickets),
          ),
          IconButton(
            icon: const Icon(Icons.person_outline),
            tooltip: 'Cá nhân',
            onPressed: () => Get.toNamed(Routes.profile),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Obx(() => Row(
            children: [
              Expanded(
                child: _TabButton(
                  label: 'Đang chiếu',
                  selected: controller.currentTab.value == MovieTab.showing,
                  onTap: () => controller.switchTab(MovieTab.showing),
                ),
              ),
              Expanded(
                child: _TabButton(
                  label: 'Sắp chiếu',
                  selected: controller.currentTab.value == MovieTab.comingSoon,
                  onTap: () => controller.switchTab(MovieTab.comingSoon),
                ),
              ),
            ],
          )),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Tìm phim...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                isDense: true,
              ),
              onChanged: controller.onSearchChanged,
            ),
          ),
          const SizedBox(height: 8),
          Obx(() {
            final genres = controller.availableGenres;
            if (genres.isEmpty) return const SizedBox.shrink();
            return SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: [
                  ChoiceChip(
                    label: const Text('Tất cả'),
                    selected: controller.selectedGenre.value.isEmpty,
                    onSelected: (_) => controller.onGenreChanged(null),
                  ),
                  const SizedBox(width: 8),
                  ...genres.map((g) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(g),
                      selected: controller.selectedGenre.value == g,
                      onSelected: (_) => controller.onGenreChanged(g),
                    ),
                  )),
                ],
              ),
            );
          }),
          const SizedBox(height: 8),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value && controller.movies.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              if (controller.errorMessage.value != null) {
                return Center(child: Text(controller.errorMessage.value!));
              }
              if (controller.movies.isEmpty) {
                return const Center(child: Text('Không tìm thấy phim nào'));
              }
              return GridView.builder(
                padding: const EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: controller.movies.length,
                itemBuilder: (context, index) {
                  final movie = controller.movies[index];
                  return GestureDetector(
                    onTap: () => controller.goToMovieDetail(movie.id!),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              movie.posterUrl,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              errorBuilder: (_, __, ___) => Container(
                                color: Colors.grey.shade300,
                                child: const Icon(Icons.movie, size: 40, color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(movie.title, maxLines: 1, overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text('⭐ ${movie.avgRating.toStringAsFixed(1)}'),
                      ],
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _TabButton({required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: selected ? Colors.red : Colors.transparent, width: 2)),
        ),
        child: Text(label, textAlign: TextAlign.center,
            style: TextStyle(fontWeight: selected ? FontWeight.bold : FontWeight.normal)),
      ),
    );
  }
}