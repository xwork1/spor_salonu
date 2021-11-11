import 'package:flutter/material.dart';
import 'package:spor_salonu/model/egzersiz.dart';

class BodyItem extends StatelessWidget {
  final Fitness listBody;
  const BodyItem({required this.listBody, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myTextStyle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {},
            leading: Image.asset(
              'images/' + listBody.bodyKucukResim,
              width: 64,
              height: 64,
            ),
            title: Text(
              listBody.egzersizAdi,
              style: myTextStyle.headline5,
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
    );
  }
}
