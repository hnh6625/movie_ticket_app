import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/services/api_client.dart';
import '../routes/app_routes.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (!authSessionManager.isAuthenticated) {
      return const RouteSettings(name: Routes.login);
    }

    return null;
  }
}