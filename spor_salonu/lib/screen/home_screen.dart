import 'package:flutter/material.dart';
import 'package:spor_salonu/adimsayar/pedometer_screen.dart';
import 'package:spor_salonu/screen/diyet_item_list.dart';
import 'package:spor_salonu/screen/egzersiz_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              PedometerScreen(today: DateTime.now()),
              const DiyetList(),
              const ExerciseList()
            ],
          ),
        ),
      ),
    );
  }
}
