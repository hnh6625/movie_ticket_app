import 'package:get/get.dart';
import 'admin_cinema_form_controller.dart';

class AdminCinemaFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminCinemaFormController>(() => AdminCinemaFormController());
  }
}