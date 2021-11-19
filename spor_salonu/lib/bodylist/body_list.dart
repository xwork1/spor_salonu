import 'package:flutter/material.dart';
import 'package:spor_salonu/bodylist/body_item.dart';
import 'package:spor_salonu/data/strings.dart';
import 'package:spor_salonu/model/egzersiz.dart';

class BodyList extends StatelessWidget {
  late List<Fitness> allBody;
  BodyList() {
    allBody = veriListele();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return BodyItem(listBody: allBody[index]);
          },
          itemCount: allBody.length,
        ),
      
      ),
    );
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
}
