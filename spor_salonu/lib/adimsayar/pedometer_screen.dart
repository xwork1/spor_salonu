import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:spor_salonu/adimsayar/counter_sensor.dart';
import 'package:spor_salonu/model/user_model.dart';

class PedometerScreen extends StatefulWidget {
  const PedometerScreen({Key? key, required this.today}) : super(key: key);

  final DateTime today;

  @override
  State<PedometerScreen> createState() => _PedometerScreenState();
}

// ignore: camel_case_types
class _PedometerScreenState extends State<PedometerScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('tr_TR');
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
              title: Text(
                "Hoşgeldin, ${loggedInUser.firstname}",
                style: const TextStyle(
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
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const CounterSensor(),
          ],
        ),
      ),
    );
  }
}
