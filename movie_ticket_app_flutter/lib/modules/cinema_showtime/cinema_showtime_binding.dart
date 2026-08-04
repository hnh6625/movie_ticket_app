import 'package:get/get.dart';
import 'cinema_showtime_controller.dart';

class CinemaShowtimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CinemaShowtimeController>(() => CinemaShowtimeController());
  }
}