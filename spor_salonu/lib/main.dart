import 'package:flutter/material.dart';
import 'package:spor_salonu/route_genarator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      onGenerateRoute: RouteGenarator.routeGenarator,
    );
  }
}
 