import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'package:movie_ticket_app_client/movie_ticket_app_client.dart';

import 'data/services/api_client.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final serverUrl = await getServerUrl();

  authSessionManager = FlutterAuthSessionManager();

  client = Client(serverUrl)
    ..connectivityMonitor = FlutterConnectivityMonitor()
    ..authSessionManager = authSessionManager;

  await authSessionManager.initialize();

  runApp(
    GetMaterialApp(
      title: 'Movie Ticket App',
      initialRoute: Routes.splash,
      getPages: AppPages.pages,
    ),
  );
}