import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:spor_salonu/adim_sayar.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final today = DateTime.now();
    return Material(
      child: Scaffold(
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

// ignore: camel_case_types
class _getProfilesState extends State<getProfiles> {
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
              title: const Text(
                "Merhaba, User",
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
            const Sensor(),
          ],
        ),
      ),
    );
  }
}
