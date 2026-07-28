// app_pages.dart
import 'package:get/get.dart';
import '../modules/home/home_view.dart';
import '../modules/home/home_binding.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    // B/C/D thêm route của mình vào đây theo đúng khuôn này
  ];
}