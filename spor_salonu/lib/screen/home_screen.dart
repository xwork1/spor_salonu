import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:spor_salonu/screen/profile_page.dart';
import 'package:spor_salonu/screen/work_out.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final today = DateTime.now();
    // ignore: unused_local_variable
    final height = MediaQuery.of(context).size.height;
    initializeDateFormatting('tr_TR');
    // ignore: unused_local_variable
    var myTextStyle = Theme.of(context).textTheme;
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      body: Stack(
        children: <Widget>[
          Positioned(
              top: 0,
              height: height * 0.45,
              left: 0,
              right: 0,
              child: getProfiles(
                today: today,
              )),
          Positioned(
              top: 300,
              height: height * 0.20,
              left: 0,
              right: 0,
              child: Container(
               
              )),
          Container(
            padding: const EdgeInsets.only(left: 0, right: 0, top: 400),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const WorkoutScreen(),
                        ),
                      );
                    },
                    child: Container(
                      margin:
                          const EdgeInsets.only(bottom: 5, left: 32, right: 32),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        gradient: LinearGradient(colors: [
                          Color(0xFF200087),
                          Color(0xFF200087),
                        ]),
                      ),
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 20),
                          const Text(
                            "EGZERSİZLERİM",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  decoration: const BoxDecoration(
                                      color: Color(0xFF5B4D9D),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25))),
                                  padding: const EdgeInsets.all(5),
                                  child: Image.asset("images/chest.png",
                                      width: 50,
                                      height: 50,
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                      color: Color(0xFF5B4D9D),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25))),
                                  padding: const EdgeInsets.all(5),
                                  child: Image.asset("images/back.png",
                                      color: Colors.white,
                                      width: 50,
                                      height: 50),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  decoration: const BoxDecoration(
                                      color: Color(0xFF5B4D9D),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25))),
                                  padding: const EdgeInsets.all(5),
                                  child: Image.asset("images/bicepss.png",
                                      color: Colors.white,
                                      width: 50,
                                      height: 50),
                                ),
                                const SizedBox(width: 10),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
