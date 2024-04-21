import 'package:flutter/material.dart';
import 'package:newsapp/components/bottomnavbar.dart';
import 'package:newsapp/splashcreen.dart';

class AppRoutes {
  static const String splashScreen = '/splashscreen';
  static const String homePage = '/bottomnavbar';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashScreen:
        return MaterialPageRoute(
        settings: settings, builder: (_) => const SplashScreen());

      case AppRoutes.homePage:
        return MaterialPageRoute(
        settings: settings, builder: (_) => const BottomNavBar());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route definded for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
