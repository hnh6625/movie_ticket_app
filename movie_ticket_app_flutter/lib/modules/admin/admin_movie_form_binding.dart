import 'package:get/get.dart';
import 'admin_movie_form_controller.dart';

class AdminMovieFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminMovieFormController>(() => AdminMovieFormController());
  }
}