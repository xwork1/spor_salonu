import 'package:flutter/material.dart';
import 'package:spor_salonu/screen/home_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:spor_salonu/screen/profile_page.dart';
import 'package:spor_salonu/screen/istatistik/page/statisctic.dart';
import 'package:spor_salonu/screen/work_out_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _pageIndex = 0;
  List<Widget> pageList = <Widget>[
    const HomeScreen(),
    const WorkoutScreen(),
    const Statistic(),
    const ProfilPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pageList[_pageIndex],
        backgroundColor: Colors.white,
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _pageIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          margin:
              const EdgeInsets.only(bottom: 5, top: 10, right: 20, left: 20),
          onTap: (index) {
            setState(() {
              _pageIndex = index;
            });
          },
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Anasayfa"),
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.explore_outlined),
              title: const Text("Egzersiz"),
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.data_usage),
              title: const Text("İstatistik"),
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text("Profil"),
            )
          ],
        ),
      ),
    );
  }
}
