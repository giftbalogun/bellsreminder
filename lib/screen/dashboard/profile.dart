// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:bellsreminder/skin/constants.dart';
import 'package:flutter/material.dart';

import 'utils/profile_widget.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: "assets/welcome/logo.png",
            onClicked: () {},
          ),
          const SizedBox(height: 24),
          buildName(),
          const SizedBox(height: 24),
          Center(child: buildUpgradeButton()),
          const SizedBox(height: 24),
          NumbersWidget(),
          const SizedBox(height: 48),
          buildAbout(),
        ],
      ),
    );
  }

  Widget buildName() {
    return Column(
      children: [
        Text(
          "Gift Balogun",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 4),
        Text(
          "blgnbalogun@gmail.com",
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }

  Widget buildUpgradeButton() {
    return ButtonWidget(
      text: 'Upgrade To PRO',
      onClicked: () {},
    );
  }

  Widget buildAbout() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            "Some Random Thing in M Head",
            style: TextStyle(fontSize: 16, height: 1.4),
          ),
        ],
      ),
    );
  }
}
