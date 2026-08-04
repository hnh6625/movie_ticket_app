import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_ticket_app_client/movie_ticket_app_client.dart';
import '../../core/base_controller.dart';
import '../../data/services/api_client.dart';

class AdminShowtimeController extends BaseController {
  late final int movieId;
  final RxList<Cinema> cinemas = <Cinema>[].obs;
  final RxList<Showtime> showtimes = <Showtime>[].obs;

  // State cho form thêm suất chiếu mới
  final Rxn<Cinema> formCinema = Rxn<Cinema>();
  final Rxn<Room> formRoom = Rxn<Room>();
  final Rx<DateTime> formDateTime =
      DateTime.now().add(const Duration(days: 1, hours: 14)).obs;
  final priceController = TextEditingController(text: '75000');

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
      resetForm();

      // getByCinemaAndMovie thực ra chỉ lọc theo movieId (bug đã biết),
      // nên nó trả về ĐỦ suất chiếu của phim này -- tiện cho việc liệt kê ở đây.
      final showtimeResult = await client.showtime.getByCinemaAndMovie(
        movieId: movieId,
        date: DateTime.now(),
      );
      showtimeResult.sort((a, b) => a.startTime.compareTo(b.startTime));
      showtimes.assignAll(showtimeResult);
    });
  }

  // Tìm rạp + phòng tương ứng với 1 roomId, để hiển thị tên trong danh sách.
  ({Cinema cinema, Room room})? findCinemaRoom(int roomId) {
    for (final cinema in cinemas) {
      for (final room in (cinema.rooms ?? <Room>[])) {
        if (room.id == roomId) return (cinema: cinema, room: room);
      }
    }
    return null;
  }

  void resetForm() {
    formCinema.value = cinemas.isNotEmpty ? cinemas.first : null;
    final rooms = formCinema.value?.rooms;
    formRoom.value = (rooms != null && rooms.isNotEmpty) ? rooms.first : null;
    formDateTime.value = DateTime.now().add(const Duration(days: 1, hours: 14));
    priceController.text = '75000';
    errorMessage.value = null;
  }

  void onFormCinemaChanged(Cinema? c) {
    formCinema.value = c;
    final rooms = c?.rooms;
    formRoom.value = (rooms != null && rooms.isNotEmpty) ? rooms.first : null;
  }

  Future<void> pickFormDateTime(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: formDateTime.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (date == null) return;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(formDateTime.value),
    );
    if (time == null) return;
    formDateTime.value = DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }

  Future<void> submitCreateForm() async {
    final room = formRoom.value;
    if (room == null) {
      errorMessage.value = 'Vui lòng chọn phòng chiếu';
      return;
    }
    final price = double.tryParse(priceController.text.trim());
    if (price == null || price <= 0) {
      errorMessage.value = 'Giá vé không hợp lệ';
      return;
    }

    await runSafely(() async {
      final result = await client.adminShowtime.create(
        movieId: movieId,
        roomId: room.id!,
        startTime: formDateTime.value,
        basePrice: price,
      );
      if (result == null) {
        errorMessage.value = 'Bạn không có quyền thực hiện thao tác này.';
        return;
      }
      showtimes.add(result);
      showtimes.sort((a, b) => a.startTime.compareTo(b.startTime));
      Get.back(); // đóng dialog thêm mới
      Get.snackbar('Thành công', 'Đã thêm suất chiếu mới');
    });
  }

  Future<void> deleteShowtime(int id) async {
    final confirmed = await Get.dialog<bool>(AlertDialog(
      title: const Text('Xác nhận'),
      content: const Text('Xóa suất chiếu này? Vé/ghế liên quan (nếu có) cũng bị ảnh hưởng.'),
      actions: [
        TextButton(onPressed: () => Get.back(result: false), child: const Text('Hủy')),
        TextButton(onPressed: () => Get.back(result: true), child: const Text('Xóa')),
      ],
    ));
    if (confirmed != true) return;

    await runSafely(() async {
      final success = await client.adminShowtime.delete(id);
      if (!success) {
        errorMessage.value = 'Xóa thất bại.';
        return;
      }
      showtimes.removeWhere((s) => s.id == id);
      Get.snackbar('Thành công', 'Đã xóa suất chiếu');
    });
  }

  @override
  void onClose() {
    priceController.dispose();
    super.onClose();
  }
}