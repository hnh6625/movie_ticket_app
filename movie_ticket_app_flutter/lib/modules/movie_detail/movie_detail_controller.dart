import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:movie_ticket_app_client/movie_ticket_app_client.dart';
import '../../core/base_controller.dart';
import '../../data/services/api_client.dart';
import '../../routes/app_routes.dart';

class MovieDetailController extends BaseController {
  late final int movieId;
  final Rxn<Movie> movie = Rxn<Movie>();
  YoutubePlayerController? youtubeController;

  @override
  void onInit() {
    super.onInit();
    movieId = Get.arguments as int;
    fetchMovie();
  }

  Future<void> fetchMovie() async {
    await runSafely(() async {
      final result = await client.movie.getById(movieId);
      if (result == null) {
        errorMessage.value = 'Không tìm thấy phim này.';
        return;
      }
      movie.value = result;
      youtubeController = YoutubePlayerController.fromVideoId(
        videoId: result.trailerYoutubeId,
        autoPlay: false,
        params: const YoutubePlayerParams(showFullscreenButton: true),
      );
    });
  }

  void goToCinemaShowtime() {
    Get.toNamed(Routes.cinemaShowtime, arguments: movieId);
  }
  void goToReview() {
    Get.toNamed(Routes.review, arguments: movieId);
  }

  @override
  void onClose() {
    youtubeController?.close();
    super.onClose();
  }
}