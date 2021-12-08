import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:spor_salonu/model/work_out.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    initializeDateFormatting('tr_TR');
    return Scaffold(
      backgroundColor: const Color(0xFF200087),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0, right: 16.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text(
                  "${DateFormat.MMMd('tr_TR').format(today)}, ${DateFormat.EEEE('tr_TR').format(today)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                subtitle: const Text(
                  'Egzersizlerim',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                trailing: Column(
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const <Widget>[
                        Icon(
                          Icons.access_time,
                          color: Colors.white30,
                        ),
                        SizedBox(height: 15,),
                        Text(
                          " 1 Saat",
                          style: TextStyle(
                            color: Colors.white30,
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                          ),
                        ),
                        SizedBox(height: 20),     
                      ],
                    ),

                  ],

                ),
              ),
           for (int i = 0; i < upperBody.length; i++)
                Column(
                  children: <Widget>[
                    for (int j = 0; j < upperBody[i].length; j++)
                      ListTile(
                        leading: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color(0xFF5B4D9D),
                          ),
                          padding: const EdgeInsets.all(6),
                          child: Image.asset(
                            upperBody[i][j].imagePath,
                            width: 45,
                            height: 45,
                            color: Colors.white,
                          ),
                        ),
                        title: Text(
                          upperBody[i][j].name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          upperBody[i][j].instruction,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 30,
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
