import 'package:get/get.dart';
import 'admin_cinema_controller.dart';

class AdminCinemaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminCinemaController>(() => AdminCinemaController());
  }
}