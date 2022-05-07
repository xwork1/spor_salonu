import 'package:flutter/material.dart';

import '../constants.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

final TextEditingController _searchController = TextEditingController();
var _throwShotAway = true;

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Align(
          child: Text(
            'Profilim ve Ayarlarım',
            style: TextStyle(color: Colors.black),
          ),
          alignment: Alignment.center,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(18),
        child: ListView(
          children: [
            Row(
              children: const [
                Icon(Icons.person),
                SizedBox(
                  width: 10,
                ),
                Text('Hesap')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
