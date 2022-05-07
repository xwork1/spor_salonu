import 'package:flutter/material.dart';

class ExerciseList extends StatelessWidget {
  const ExerciseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 200,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/WorkOut');
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 5, left: 32, right: 32),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            padding: const EdgeInsets.all(5),
                            child: Image.asset("images/chest.png",
                                width: 50, height: 50, color: Colors.white),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: Color(0xFF5B4D9D),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            padding: const EdgeInsets.all(5),
                            child: Image.asset("images/back.png",
                                color: Colors.white, width: 50, height: 50),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            decoration: const BoxDecoration(
                                color: Color(0xFF5B4D9D),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            padding: const EdgeInsets.all(5),
                            child: Image.asset("images/bicepss.png",
                                color: Colors.white, width: 50, height: 50),
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
    );
  }
}
