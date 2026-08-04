import 'package:get/get.dart';

import '../../core/base_controller.dart';
import '../../data/services/api_client.dart';
import '../../routes/app_routes.dart';

class SplashController extends BaseController {
  @override
  void onInit() {
    super.onInit();
    _checkAuthAndRedirect();
  }

  Future<void> _checkAuthAndRedirect() async {
    await runSafely(() async {
      await Future.delayed(
        const Duration(milliseconds: 800),
      );

      Get.offAllNamed(
        authSessionManager.isAuthenticated
            ? Routes.home
            : Routes.login,
      );
    });
  }
}