import 'package:flutter/material.dart';
import 'package:spor_salonu/bodylist/body_list.dart';
import 'package:spor_salonu/view/loginscreen.dart';
import 'package:spor_salonu/view/register.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  List<Widget> pageList = <Widget> [
    BodyList(),
    const LoginPage(),
    const RegisterPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pageList[pageIndex],
        bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: "Exercise"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],),
        ),
    );
  }
}