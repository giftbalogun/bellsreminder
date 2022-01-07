import 'dart:async';

import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), openOnBoard);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/welcome/logo.png'),
          )),
        ),
      ),
    );
  }

  void openOnBoard() {
    Navigator.pushNamed(context, '/onboarding');
  }
}
