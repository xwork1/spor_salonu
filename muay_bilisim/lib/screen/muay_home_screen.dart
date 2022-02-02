import 'package:flutter/material.dart';
import 'package:muay_bilisim/widget/musteri_total_is.dart';
import 'package:muay_bilisim/widget/musteri_total_odeme.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const <Widget>[
          TotalWork(),
          Divider(height: 20),
          TotalPay(),
        ],
      ),
    );
  }
}
