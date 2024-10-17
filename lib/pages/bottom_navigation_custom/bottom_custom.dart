import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/pages/screens/detail_screen.dart';
import 'package:instagram/pages/screens/home_screen.dart';

class BottomNavigationCustom extends StatefulWidget {
  const BottomNavigationCustom({super.key});

  @override
  State<BottomNavigationCustom> createState() => _BottomNavigationCustomState();
}

class _BottomNavigationCustomState extends State<BottomNavigationCustom> {
  List<BottomNavigationBarItem> listItem = [
    const BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.home,
        ),
        label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.list_bullet), label: 'List'),
  ];

  List<Widget> listScreen = [const HomeScreen(), const DetailScreen()];

  int activeNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      body: listScreen[activeNumber],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: activeNumber,
        elevation: 0,
        backgroundColor: const Color(0xFF19D2FE),
        items: listItem,
        selectedItemColor: const Color.fromARGB(255, 11, 125, 218),
        unselectedItemColor: Colors.white,
        onTap: (value) => setState(() {
          activeNumber = value;
        }),
      ),
    );
  }
}
