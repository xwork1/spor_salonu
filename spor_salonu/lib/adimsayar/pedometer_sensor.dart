import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PedometerSensor extends StatefulWidget {
  const PedometerSensor({Key? key}) : super(key: key);

  @override
  _PedometerSensorState createState() => _PedometerSensorState();
}

class _PedometerSensorState extends State<PedometerSensor> {
  late Stream<StepCount> _stepCountStream;

  String _steps = '?';
  String _totalKalori = '?';
  String _totalKm = '?';
  late num kalori;
  late num km;
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
      kalori = 0.05 * event.steps;
      _totalKalori = kalori.toStringAsFixed(2);
      km = 0.0008 * event.steps;
      _totalKm = km.toStringAsFixed(2);
    });
  }

  void onStepCountError(error) {
    // ignore: avoid_print
    print('onStepCountError: $error');
    setState(() {
      _steps = '0';
      _totalKalori = "0";
      _totalKm = "0";
    });
  }

  void initPlatformState() {
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double km = 0.1, kalori = 0.1;
    return Row(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularPercentIndicator(
              radius: 80.0,
              animation: false,
              animationDuration: 1200,
              lineWidth: 10.0,
              percent: 0.2,
              center: Text(
                _steps,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              circularStrokeCap: CircularStrokeCap.square,
              backgroundColor: const Color(0xFF200087),
              progressColor: Colors.grey.shade300,
            ),
          ],
        ),
        const SizedBox(width: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("kcal".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    )),
                LinearPercentIndicator(
                  width: width * 0.28,
                  lineHeight: 5.0,
                  percent: kalori * 3,
                  trailing: Text(_totalKalori),
                  barRadius: const Radius.circular(10),
                  backgroundColor: Colors.black12,
                  progressColor: Colors.green,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("km".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    )),
                LinearPercentIndicator(
                  width: width * 0.28,
                  lineHeight: 5.0,
                  percent: km * 0.5,
                  trailing: Text(_totalKm),
                  barRadius: const Radius.circular(10),
                  backgroundColor: Colors.black12,
                  progressColor: Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Adım".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    )),
                LinearPercentIndicator(
                  width: width * 0.28,
                  lineHeight: 5.0,
                  percent: km * 0.5,
                  trailing: Text(_steps),
                  barRadius: const Radius.circular(10),
                  backgroundColor: Colors.black12,
                  progressColor: Colors.yellow,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
