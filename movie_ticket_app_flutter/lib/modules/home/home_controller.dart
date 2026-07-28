import '../../core/base_controller.dart';
import '../../data/services/api_client.dart';
import 'package:get/get.dart';
import 'package:movie_ticket_app_client/movie_ticket_app_client.dart';

class HomeController extends BaseController {
  final movies = <Movie>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchMovies(); // tự gọi API ngay khi Controller được tạo
  }

  Future<void> fetchMovies() async {
    await runSafely(() async {
      final result = await client.movie.getAll();
      movies.assignAll(result);
    });
  }
}