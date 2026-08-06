import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'package:movie_ticket_app_client/movie_ticket_app_client.dart';

import 'data/services/api_client.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

const _googleClientId =
    '786806910667-sibe5f9esfbrtk1s8u1fdrl59opgeg5g.apps.googleusercontent.com';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final serverUrl = await getServerUrl();

  authSessionManager = FlutterAuthSessionManager();

  client = Client(serverUrl)
    ..connectivityMonitor = FlutterConnectivityMonitor()
    ..authSessionManager = authSessionManager;

  await authSessionManager.initialize();

  await authSessionManager.initializeGoogleSignIn(
    clientId: _googleClientId,
    serverClientId: _googleClientId,
  );

  runApp(
    GetMaterialApp(
      title: 'Movie Ticket App',
      initialRoute: Routes.splash,
      getPages: AppPages.pages,
    ),
  );
}