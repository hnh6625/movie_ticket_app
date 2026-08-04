import 'package:get/get.dart';
import 'admin_showtime_controller.dart';

class AdminShowtimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminShowtimeController>(() => AdminShowtimeController());
  }
}