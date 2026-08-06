import 'package:get/get.dart';

import '../modules/auth/auth_view.dart';
import '../modules/home/home_view.dart';
import '../modules/home/home_binding.dart';
import '../modules/profile/profile_binding.dart';
import '../modules/profile/profile_view.dart';
import '../modules/seat_selection/seat_selection_view.dart';
import '../modules/seat_selection/seat_selection_binding.dart';
import '../modules/movie_detail/movie_detail_view.dart';
import '../modules/movie_detail/movie_detail_binding.dart';
import '../modules/cinema_showtime/cinema_showtime_view.dart';
import '../modules/cinema_showtime/cinema_showtime_binding.dart';
import '../modules/review/review_view.dart';
import '../modules/review/review_binding.dart';
import '../modules/admin/admin_movie_view.dart';
import '../modules/admin/admin_movie_binding.dart';
import '../modules/admin/admin_movie_form_view.dart';
import '../modules/admin/admin_movie_form_binding.dart';
import '../modules/admin/admin_showtime_view.dart';
import '../modules/admin/admin_showtime_binding.dart';
import '../modules/admin/admin_cinema_view.dart';
import '../modules/admin/admin_cinema_binding.dart';
import '../modules/admin/admin_cinema_form_view.dart';
import '../modules/admin/admin_cinema_form_binding.dart';

import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_view.dart';

import '../modules/concession/concession_view.dart';
import '../modules/concession/concession_binding.dart';

import '../modules/cart/cart_view.dart';
import '../modules/cart/cart_binding.dart';

import '../modules/payment/payment_view.dart';
import '../modules/payment/payment_binding.dart';

import '../modules/ticket/ticket_binding.dart';
import '../modules/ticket/ticket_view.dart';
import '../modules/ticket/my_tickets_binding.dart';
import '../modules/ticket/my_tickets_view.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: Routes.login,
      page: () => const AuthView(),
    ),

    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: Routes.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),

    GetPage(
      name: Routes.seatSelection,
      page: () => const SeatSelectionView(),
      binding: SeatSelectionBinding(),
    ),

    GetPage(
      name: Routes.concessions,
      page: () => const ConcessionView(),
      binding: ConcessionBinding(),
    ),

    GetPage(
      name: Routes.cart,
      page: () => const CartView(),
      binding: CartBinding(),
    ),

    GetPage(
      name: Routes.payment,
      page: () => const PaymentView(),
      binding: PaymentBinding(),
    ),

    GetPage(
      name: Routes.ticket,
      page: () => const TicketView(),
      binding: TicketBinding(),
    ),

    GetPage(
      name: Routes.myTickets,
      page: () => const MyTicketsView(),
      binding: MyTicketsBinding(),
    ),
    GetPage(
        name: Routes.movieDetail,
        page: () => const MovieDetailView(),
        binding: MovieDetailBinding()),
    GetPage(
        name: Routes.cinemaShowtime,
        page: () => const CinemaShowtimeView(),
        binding: CinemaShowtimeBinding()),
    GetPage(
        name: Routes.review,
        page: () => const ReviewView(),
        binding: ReviewBinding()),
    GetPage(
        name: Routes.adminMovie,
        page: () => const AdminMovieView(),
        binding: AdminMovieBinding()),
    GetPage(
        name: Routes.adminMovieForm,
        page: () => const AdminMovieFormView(),
        binding: AdminMovieFormBinding()),
    GetPage(
        name: Routes.adminShowtime,
        page: () => const AdminShowtimeView(),
        binding: AdminShowtimeBinding()),
    GetPage(
        name: Routes.adminCinema,
        page: () => const AdminCinemaView(),
        binding: AdminCinemaBinding()),
    GetPage(
        name: Routes.adminCinemaForm,
        page: () => const AdminCinemaFormView(),
        binding: AdminCinemaFormBinding()),
  ];
}