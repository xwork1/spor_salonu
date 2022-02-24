import 'package:flutter/material.dart';
import 'package:spor_salonu/nav_bar.dart';
import 'package:spor_salonu/screen/work_out_screen.dart';

class RouteGenarator {
  static Route<dynamic>? routeGenarator(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const NavBar(),
        );
      /*case '/HomeScreen':
        return MaterialPageRoute(
          builder: (context) => const NavBar(),
        );*/
      case '/WorkOut':
        return MaterialPageRoute(
          builder: (context) => const WorkoutScreen(),
        );
    }
    return null;
  }
}
