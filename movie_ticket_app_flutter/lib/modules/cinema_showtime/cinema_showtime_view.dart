import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:intl/intl.dart';
import 'cinema_showtime_controller.dart';

class CinemaShowtimeView extends GetView<CinemaShowtimeController> {
  const CinemaShowtimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chọn rạp & suất chiếu')),
      body: Obx(() {
        if (controller.isLoading.value && controller.cinemas.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        final cinema = controller.selectedCinema.value;
        return Column(
          children: [
            SizedBox(
              height: 44,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: controller.cinemas.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final c = controller.cinemas[index];
                  final selected = c.id == cinema?.id;
                  return ChoiceChip(
                    label: Text(c.name),
                    selected: selected,
                    onSelected: (_) => controller.selectCinema(c),
                  );
                },
              ),
            ),
            SizedBox(
              height: 220,
              child: cinema == null
                  ? const SizedBox.shrink()
                  : FlutterMap(
                options: MapOptions(
                  initialCenter: LatLng(cinema.latitude, cinema.longitude),
                  initialZoom: 15,
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.yourteam.movieticket', // đổi đúng applicationId
                  ),
                  MarkerLayer(markers: [
                    Marker(
                      point: LatLng(cinema.latitude, cinema.longitude),
                      width: 40,
                      height: 40,
                      child: const Icon(Icons.location_pin, color: Colors.red, size: 40),
                    ),
                  ]),
                ],
              ),
            ),
            if (cinema != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(cinema.address, style: const TextStyle(color: Colors.grey)),
              ),
            const Divider(),
            SizedBox(
              height: 60,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: 7,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final date = DateTime.now().add(Duration(days: index));
                  final selected = DateUtils.isSameDay(date, controller.selectedDate.value);
                  return ChoiceChip(
                    label: Text(DateFormat('E dd/MM').format(date)),
                    selected: selected,
                    onSelected: (_) => controller.selectDate(date),
                  );
                },
              ),
            ),
            const Divider(),
            Expanded(
              child: controller.showtimes.isEmpty
                  ? const Center(child: Text('Không có suất chiếu trong ngày này'))
                  : GridView.builder(
                padding: const EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: controller.showtimes.length,
                itemBuilder: (context, index) {
                  final s = controller.showtimes[index];
                  return OutlinedButton(
                    onPressed: () => controller.selectShowtime(s),
                    child: Text(DateFormat('HH:mm').format(s.startTime)),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}