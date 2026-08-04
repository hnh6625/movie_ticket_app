import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_ticket_app_client/movie_ticket_app_client.dart';
import '../../core/base_controller.dart';
import '../../data/services/api_client.dart';
import '../../routes/app_routes.dart';

class CinemaShowtimeController extends BaseController {
  late final int movieId;
  final RxList<Cinema> cinemas = <Cinema>[].obs;
  final Rxn<Cinema> selectedCinema = Rxn<Cinema>();
  final Rx<DateTime> selectedDate = DateTime.now().obs;

  // Server (ShowtimeEndpoint.getByCinemaAndMovie) thực ra chỉ lọc theo
  // movieId, KHÔNG lọc theo rạp hay ngày (dù tên hàm là "ByCinemaAndMovie").
  // Nên mình lấy hết 1 lần rồi tự lọc theo rạp + ngày ở client.
  final RxList<Showtime> _allShowtimes = <Showtime>[].obs;
  final RxList<Showtime> showtimes = <Showtime>[].obs;

  @override
  void onInit() {
    super.onInit();
    movieId = Get.arguments as int;
    _loadData();
  }

  Future<void> _loadData() async {
    await runSafely(() async {
      final cinemaResult = await client.cinema.getAll();
      cinemas.assignAll(cinemaResult);
      if (cinemas.isNotEmpty) selectedCinema.value = cinemas.first;

      final showtimeResult = await client.showtime.getByCinemaAndMovie(
        movieId: movieId,
        date: selectedDate.value,
      );
      _allShowtimes.assignAll(showtimeResult);
      _applyFilter();
    });
  }

  void selectCinema(Cinema cinema) {
    selectedCinema.value = cinema;
    _applyFilter();
  }

  void selectDate(DateTime date) {
    selectedDate.value = date;
    _applyFilter();
  }

  void _applyFilter() {
    final cinema = selectedCinema.value;
    if (cinema == null) {
      showtimes.clear();
      return;
    }
    final roomIds = (cinema.rooms ?? [])
        .map((r) => r.id)
        .whereType<int>()
        .toSet();

    showtimes.assignAll(_allShowtimes.where((s) =>
    roomIds.contains(s.roomId) &&
        DateUtils.isSameDay(s.startTime, selectedDate.value)));
  }

  void selectShowtime(Showtime showtime) {
    Get.toNamed(Routes.seatSelection, arguments: {'showtimeId': showtime.id});

  }
}