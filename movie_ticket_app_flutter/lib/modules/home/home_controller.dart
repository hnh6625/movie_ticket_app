import 'package:get/get.dart';
import 'package:movie_ticket_app_client/movie_ticket_app_client.dart';
import '../../core/base_controller.dart';
import '../../data/services/api_client.dart';
import '../../routes/app_routes.dart';

enum MovieTab { showing, comingSoon }

class HomeController extends BaseController {
  final Rx<MovieTab> currentTab = MovieTab.showing.obs;
  final RxList<Movie> _allMovies = <Movie>[].obs; // toàn bộ phim, lấy 1 lần
  final RxList<Movie> movies = <Movie>[].obs; // đã lọc theo tab + tìm kiếm + thể loại
  final RxString searchQuery = ''.obs;
  final RxString selectedGenre = ''.obs; // '' nghĩa là tất cả thể loại

  @override
  void onInit() {
    super.onInit();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    await runSafely(() async {
      final result = await client.movie.getAll();
      _allMovies.assignAll(result);
      _applyFilter();
    });
  }

  // Danh sách thể loại có thật trong dữ liệu, để đổ vào dropdown lọc
  List<String> get availableGenres {
    final genres = _allMovies.map((m) => m.genre).toSet().toList();
    genres.sort();
    return genres;
  }

  void switchTab(MovieTab tab) {
    if (currentTab.value == tab) return;
    currentTab.value = tab;
    _applyFilter();
  }

  void onSearchChanged(String query) {
    searchQuery.value = query;
    _applyFilter();
  }

  void onGenreChanged(String? genre) {
    selectedGenre.value = genre ?? '';
    _applyFilter();
  }

  void _applyFilter() {
    final status = currentTab.value == MovieTab.showing ? 'SHOWING' : 'COMING_SOON';
    final query = searchQuery.value.trim().toLowerCase();

    movies.assignAll(_allMovies.where((m) {
      if (m.status != status) return false;
      if (selectedGenre.value.isNotEmpty && m.genre != selectedGenre.value) return false;
      if (query.isNotEmpty && !m.title.toLowerCase().contains(query)) return false;
      return true;
    }));
  }

  void goToMovieDetail(int movieId) {
    Get.toNamed(Routes.movieDetail, arguments: movieId);
  }
}