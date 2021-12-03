import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:spor_salonu/data/strings.dart';
import 'package:spor_salonu/model/egzersiz.dart';
import 'package:spor_salonu/view/training_list.dart';
import 'package:spor_salonu/view/profile_page.dart';
class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);
  @override
  State<FirstPage> createState() => _FirstPageState();
}

List<dynamic> datalist = [
  ['Göğüs', 'gogus.png', 'Pazartesi'],
  ['Omuz', 'omuz.png', 'Salı'],
  ['Sırt-Kanat', 'sirt.png', 'Çarşamba'],
  ['Üst (önkol)', 'biceps.png', 'Perşembe'],
  ['Bacak', 'bacak.png', 'Cuma'],
  ['ABS', 'karin.png', 'Cumartesi'],
];

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final height = MediaQuery.of(context).size.height;
    initializeDateFormatting('tr_TR');
    // ignore: unused_local_variable
    var myTextStyle = Theme.of(context).textTheme;
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff0E1117),
        body: CustomScrollView(
          slivers: [
            
            SliverFillRemaining(
              child: Container(
                padding: const EdgeInsets.only(bottom: 350,left: 20, right: 20, top: 30),
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
                          margin: const EdgeInsets.only(
                              bottom: 5, left: 32, right: 32),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            gradient: LinearGradient(colors: [
                              Color(0xff161B22),
                              Color(0xff161B22),
                            ]),
                          ),
                          child: Column(
                            children: <Widget>[
                              const SizedBox(height: 20),
                              const Text(
                                "EGZERSİZLERİM",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
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
            )
          ],
        ),
      ),
    );
  }
}
