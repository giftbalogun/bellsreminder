import 'package:bellsreminder/skin/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  _buildbutton(context, text, wowme, textColor, press) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: ElevatedButton(
          child: Text(
            text,
            style: TextStyle(color: wowme),
          ),
          onPressed: () {
            Navigator.pushNamed(context, press);
          },
          style: ElevatedButton.styleFrom(
            primary: textColor,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            textStyle: TextStyle(
                color: textColor, fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_top.png",
              width: size.width * 0.3,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_bottom.png",
              width: size.width * 0.2,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "WELCOME TO BELLS UNIVERSITY REMINDER",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.05),
                SvgPicture.asset(
                  "assets/icons/chat.svg",
                  height: size.height * 0.45,
                ),
                SizedBox(height: size.height * 0.05),
                _buildbutton(
                    context, "Login", Colors.white, kPrimaryColor, "/login"),
                _buildbutton(context, "Signup", Colors.black,
                    kPrimaryLightColor, "/signup")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
