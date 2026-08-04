import 'package:get/get.dart';

import '../modules/auth/auth_view.dart';
import '../modules/home/home_view.dart';
import '../modules/home/home_binding.dart';
import '../modules/profile/profile_binding.dart';
import '../modules/profile/profile_view.dart';
import '../modules/seat_selection/seat_selection_view.dart';
import '../modules/seat_selection/seat_selection_binding.dart';

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
  ];
}