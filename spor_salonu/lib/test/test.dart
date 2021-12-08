import 'package:flutter/material.dart';
import 'dart:async';

import 'package:pedometer/pedometer.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}

class Pedometre extends StatefulWidget {
  const Pedometre({Key? key}) : super(key: key);

  @override
  _PedometreState createState() => _PedometreState();
}

class _PedometreState extends State<Pedometre> {
  late Stream<StepCount> _stepCountStream;

  String _steps = '?';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    // ignore: avoid_print
    print(event);
    setState(() {
      _steps = event.steps.toString();
    });
  }


  void onStepCountError(error) {
    // ignore: avoid_print
    print('onStepCountError: $error');
    setState(() {
      _steps = 'inaktif';
    });
  }

  void initPlatformState() {
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularPercentIndicator(
              radius: 150.0,
              animation: true,
              animationDuration: 1200,
              lineWidth: 15.0,
              percent: 0.4,
              center: Text(
                _steps,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              circularStrokeCap: CircularStrokeCap.square,
              backgroundColor: Colors.yellow,
              progressColor: Colors.red,
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                LinearPercentIndicator(
                  width: 140.0,
                lineHeight: 14.0,
                percent: 0.5,
                center: const Text(
                  "KCal",
                  style: TextStyle(fontSize: 12.0),
                ),
                trailing: const Icon(Icons.mood),
                linearStrokeCap: LinearStrokeCap.roundAll,
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
              ),
              LinearPercentIndicator(
                  width: 140.0,
                lineHeight: 14.0,
                percent: 0.5,
                center: const Text(
                  "Km",
                  style: TextStyle(fontSize: 12.0),
                ),
                trailing: Icon(Icons.camera_rounded),
                linearStrokeCap: LinearStrokeCap.roundAll,
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
              ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
