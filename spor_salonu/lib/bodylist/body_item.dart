import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:spor_salonu/data/strings.dart';
import 'package:spor_salonu/model/egzersiz.dart';

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
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text('Egzersizler',
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 14,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                    Expanded(
                      flex: 2,
                      child: ListView.builder(
                        padding: const EdgeInsets.only(top: 20),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: datalist.length,
                        itemBuilder: (context, index) {
                          return FadeInDown(
                            duration: const Duration(milliseconds: 1500),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                color: const Color(0xff161B22),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'images/' + datalist[index][1],
                                          width: 50,
                                          height: 50,
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              datalist[index][0],
                                              style: TextStyle(
                                                  color: Colors.grey.shade400,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              datalist[index][2],
                                              style: TextStyle(
                                                  color:
                                                      Colors.blueGrey.shade700,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Icon(Icons.arrow_forward_ios),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
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

List<Fitness> veriListele() {
  List<Fitness> gecici = [];
  for (int i = 0; i < 7; i++) {
    var egzersizAdi = Strings.EGZERSIZ_ADLARI[i];
    var bodyKucukResim = Strings.EGZERSIZ_IMAGES[i].toLowerCase() + '.png';
    Fitness eklenecekBody = Fitness(egzersizAdi, bodyKucukResim);
    gecici.add(eklenecekBody);
  }
  return gecici;
}
