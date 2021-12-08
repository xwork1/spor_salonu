import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pedometer/pedometer.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final today = DateTime.now();
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            height: height * 0.45,
            left: 0,
            right: 0,
            child: getProfiles(today: today),
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class getProfiles extends StatefulWidget {
  const getProfiles({Key? key, required this.today}) : super(key: key);

  final DateTime today;
  
  @override
  State<getProfiles> createState() => _getProfilesState();
  
}

class _getProfilesState extends State<getProfiles> {
  
  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(40),
      ),
      child: Container(
        color: Colors.white,
        padding:
            const EdgeInsets.only(top: 50, left: 32, right: 16, bottom: 10),
        child: Column(
          children: <Widget>[
            ListTile(
              title: const Text(
                "Merhaba, Users",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 26,
                ),
              ),
              subtitle: Text(
                "${DateFormat.MMMd('tr_TR').format(widget.today)}, ${DateFormat.EEEE('tr_TR').format(widget.today)}",
                style: const TextStyle(color: Colors.black),
              ),
              trailing: const Icon(
                Icons.person,
                size: 60,
                color: Colors.black,
              ), //image eklersen consttan çıkar
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                _RadialProgress(
                  width: width * 0.4,
                  height: width * 0.4,
                  progress: 0.7,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _IngredientProgress(
                      ingredient: "KCal",
                      progress: 0.3,
                      leftAmount: 72,
                      width: width * 0.28,
                      progressColor: Colors.green,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _IngredientProgress(
                      ingredient: "Km",
                      progress: 0.2,
                      leftAmount: 252,
                      width: width * 0.28,
                      progressColor: Colors.red,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _IngredientProgress(
                      ingredient: "Steps",
                      progress: 0.5,
                      leftAmount: 61,
                      width: width * 0.28,
                      progressColor: Colors.yellow,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _IngredientProgress extends StatelessWidget {
  final String ingredient;
  final int leftAmount;
  final double progress, width;
  final Color progressColor;
  const _IngredientProgress({
    Key? key,
    required this.ingredient,
    required this.leftAmount,
    required this.progress,
    required this.width,
    required this.progressColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(ingredient.toUpperCase(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              )),
        LinearPercentIndicator(
          width: width,
          lineHeight: 10.0,
          percent: 1 * progress,
          trailing: Text("$leftAmount"),
          linearStrokeCap: LinearStrokeCap.roundAll,
          backgroundColor: Colors.black12,
          progressColor: progressColor,
        ),
      ],
    );
  }
}

class _RadialProgress extends StatefulWidget {
  final double height, width, progress;

  const _RadialProgress(
      {Key? key,
      required this.height,
      required this.width,
      required this.progress})
      : super(key: key);

  @override
  State<_RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<_RadialProgress> {
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
    return Column(
        children: <Widget>[
          CircularPercentIndicator(
            radius: 150.0,
            animation: true,
            animationDuration: 1200,
            lineWidth: 10.0,
            percent: 0.2,
            center: Text(
              _steps,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            circularStrokeCap: CircularStrokeCap.square,
            backgroundColor: const Color(0xFF200087),
            progressColor: Colors.grey.shade300,
          ),
        ],
      );
  }
}

