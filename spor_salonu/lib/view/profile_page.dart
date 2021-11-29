import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            height: height * 0.35,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(40),
              ),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.only(
                    top: 50, left: 32, right: 16, bottom: 10),
                child: Column(
                  children: const <Widget>[
                    ListTile(
                      title: Text(
                        "Date, Year",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      subtitle: Text("Merhaba, Users"),
                      trailing: Icon(Icons.person,size: 60,), //image eklersen consttan çıkar
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
