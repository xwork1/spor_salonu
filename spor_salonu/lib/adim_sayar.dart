import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Sensor extends StatefulWidget {
  const Sensor({Key? key}) : super(key: key);

  @override
  _SensorState createState() => _SensorState();
}

class _SensorState extends State<Sensor> {
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
      _steps = '0';
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
    return Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularPercentIndicator(
                radius: 150.0,
                animation: true,
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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("kcal".toUpperCase(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          )),
                      LinearPercentIndicator(
                        width: width * 0.4,
                        lineHeight: 5.0,
                        percent: 0.5,
                        trailing: const Text("250"),
                        linearStrokeCap: LinearStrokeCap.roundAll,
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
                        width: width * 0.4,
                        lineHeight: 5.0,
                        percent: 0.5,
                        trailing: const Text("33"),
                        linearStrokeCap: LinearStrokeCap.roundAll,
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
                        width: width * 0.4,
                        lineHeight: 5.0,
                        percent: 0.5,
                        trailing: Text(_steps),
                        linearStrokeCap: LinearStrokeCap.roundAll,
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
