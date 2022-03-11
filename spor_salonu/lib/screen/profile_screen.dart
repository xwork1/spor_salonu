import 'package:flutter/material.dart';

import '../constants.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

final TextEditingController _searchController = TextEditingController();

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            "Profilim",
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          TextFormField(
            controller: _searchController,
            autofocus: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: const BorderSide(color: Colors.black)),
              suffixIcon: IconButton(
                onPressed: _searchController.clear,
                icon: const Icon(Icons.clear),
              ),
              prefixIcon: const Icon(Icons.search),
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: "Ara",
              hintStyle: kHintStyle,
              fillColor: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Hoşgeldin Kullanıcı",
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Image.asset(
                    "images/gym-logo.gif",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          const Text('E-mail değiştir'),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.mail,
              color: Colors.black,
            ),
          ),
          const Text('Şifre değiştir'),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.password,
            ),
          ),
          const Text('Ayarlar değiştir'),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
    );
  }
}
