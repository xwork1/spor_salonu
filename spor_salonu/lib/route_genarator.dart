import 'package:flutter/material.dart';
import 'package:spor_salonu/nav_bar.dart';
import 'package:spor_salonu/screen/loginscreen.dart';

class RouteGenarator {
  static Route<dynamic>? routeGenarator(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      case '/homescreen':
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
    }
  }
}
