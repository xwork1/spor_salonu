import 'package:flutter/material.dart';
import 'package:spor_salonu/bodylist/body_detay.dart';
import 'package:spor_salonu/bodylist/body_item.dart';
import 'package:spor_salonu/view/profile_page.dart';
import 'package:spor_salonu/view/register.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;
  List<Widget> pageList = <Widget> [
    const FirstPage(),
    const BodyDetay(),
    const RegisterPage(),
    const ProfilPage(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pageList[_pageIndex],
        backgroundColor: Colors.blueGrey,
        bottomNavigationBar: SalomonBottomBar(
        
        currentIndex: _pageIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        margin: const EdgeInsets.only(bottom: 5, top: 10, right: 20, left: 20),
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Anasayfa"),
            selectedColor: Colors.redAccent
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.explore_outlined),
            title: const Text("Egzersiz"),
            selectedColor: Colors.redAccent
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.data_usage),
            title: const Text("İstatistik"),
            selectedColor: Colors.redAccent
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Profil"),
            selectedColor: Colors.redAccent
          )
        ],),
        ),
    );
  }
}