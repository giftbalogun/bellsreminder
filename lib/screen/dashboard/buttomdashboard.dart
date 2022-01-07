// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bellsreminder/auth/login.dart';
import 'package:bellsreminder/screen/dashboard/dashboard.dart';
import 'package:bellsreminder/screen/dashboard/profile.dart';
import 'package:bellsreminder/skin/card_courses.dart';
import 'package:bellsreminder/skin/constants.dart';
import 'package:bellsreminder/skin/header.dart';
import 'package:flutter/material.dart';

import 'utils/LearnerBottomNavigationBar.dart';
import 'utils/LearnerImages.dart';

class ButtomDashboard extends StatefulWidget {
  const ButtomDashboard({Key? key}) : super(key: key);

  @override
  _ButtomDashboardState createState() => _ButtomDashboardState();
}

class _ButtomDashboardState extends State<ButtomDashboard> {
  final TextEditingController _searchControl = TextEditingController();
  late FocusNode myFocusNode;

  var selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    Login(),
    const Text(
      'Location',
    ),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      print(selectedIndex);
      if (selectedIndex == 0) {
        print("Home");
      } else if (selectedIndex == 1) {
        print("Search");
      } else if (selectedIndex == 2) {
        print("Chart");
      } else if (selectedIndex == 3) {
        print("Chat");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _searchControl.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Color(0xFFF6F7FA),
              offset: Offset.fromDirection(3, 1),
              spreadRadius: 1,
              blurRadius: 5)
        ]),
        child: LearnerBottomNavigationBar(
          items: const <LearnerBottomNavigationBarItem>[
            LearnerBottomNavigationBarItem(icon: Learner_ic_home_navigation),
            LearnerBottomNavigationBarItem(icon: Learner_ic_search_navigation),
            LearnerBottomNavigationBarItem(icon: Learner_ic_chart_navigation),
            LearnerBottomNavigationBarItem(icon: Learner_ic_chart_navigation),
          ],
          currentIndex: selectedIndex,
          unselectedIconTheme:
              IconThemeData(color: Color(0xFF6F35A5), size: 24),
          selectedIconTheme: IconThemeData(color: Color(0xFF345FFB), size: 24),
          onTap: _onItemTapped,
          type: LearnerBottomNavigationBarType.fixed,
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
    );
  }
}
