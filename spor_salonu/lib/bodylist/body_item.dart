import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:spor_salonu/constants.dart';
import 'package:spor_salonu/model/egzersiz.dart';
import 'package:spor_salonu/view/register.dart';

class BodyItem extends StatelessWidget {
  final Fitness listBody;
  const BodyItem({required this.listBody, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myTextStyle = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: InkWell(
        onTap: () { },
        child: Stack(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 70),
              decoration: const BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
                vertical: kDefaultPadding / 2,
              ),
              // color: Colors.blueAccent,
              height: 160,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 136,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: kBlueColor,
                      boxShadow: const [kDefaultShadow],
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                height: 160,
                width: 200,
                child: Image.asset(
                  'images/' + listBody.bodyKucukResim,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: -10,
              child: SizedBox(
                height: 136,
                width: size.width - 100,
                child: Column(
                  children: <Widget>[
                    Text(
                      listBody.egzersizAdi,
                      style: myTextStyle.headline5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
