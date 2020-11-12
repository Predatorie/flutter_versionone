import 'package:flutter/material.dart';
import 'package:flutter_versionone/bindings/dashboard_binding.dart';
import 'package:flutter_versionone/bindings/login_binding.dart';
import 'package:flutter_versionone/bindings/search_binding.dart';
import 'package:flutter_versionone/bindings/team_binding.dart';
import 'package:flutter_versionone/bindings/teams_binding.dart';
import 'package:flutter_versionone/branding.dart';
import 'package:flutter_versionone/views/dashboard_view.dart';
import 'package:flutter_versionone/views/login_view.dart';
import 'package:flutter_versionone/views/search_view.dart';
import 'package:flutter_versionone/views/team_view.dart';
import 'package:flutter_versionone/views/teams_view.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  /// TODO: determine if we have a stored and valid access token
  /// TODO: navigate accordingly
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginView(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: '/dashboard',
          page: () => DashboardView(),
          binding: DashboardBinding(),
        ),
        GetPage(
          name: '/team',
          page: () => TeamView(),
          binding: TeamBinding(),
        ),
        GetPage(
          name: '/teams',
          page: () => TeamsView(),
          binding: TeamsBinding(),
        ),
        GetPage(
          name: '/search',
          page: () => SearchView(),
          binding: SearchBinding(),
        ),
      ],
      title: 'Gabs',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ).copyWith(primaryColor: mastercamRed),
    );
  }
}
