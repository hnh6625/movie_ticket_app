import 'package:get/get.dart';
import 'admin_movie_controller.dart';

class AdminMovieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminMovieController>(() => AdminMovieController());
  }
}