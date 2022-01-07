import 'package:bellsreminder/skin/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  List<String> listOfCategory = [
    '100 Level',
    '200 Level',
    '300 Level',
    '400 Level',
    '500 Level'
  ];
  String? selectedIndexCategory = '200 Level';

  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  _textfield(context, onChanged, icon, hintText) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextField(
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }

  _textpassword(context, onChanged) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: const InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  _reasonregistraion(context, press) {
    final bool login;
    login = false;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don’t have an Account ? " : "Already have an Account ? ",
          style: const TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, press);
          },
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: const TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
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
      // Here i can use size.width but use double.infinity because both work as a same
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/signup_top.png",
              width: size.width * 0.35,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_bottom.png",
              width: size.width * 0.25,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "SIGNUP",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.03),
                SvgPicture.asset(
                  "assets/icons/signup.svg",
                  height: size.height * 0.35,
                ),
                _textfield(context, (value) {}, Icons.email, "Firstname"),
                _textfield(context, (value) {}, Icons.email, "Lastname"),
                _textfield(context, (value) {}, Icons.email, "Username"),
                _textfield(context, (value) {}, Icons.email, "Your Email"),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: kPrimaryLightColor,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: DropdownButton(
                    isExpanded: true,
                    value: selectedIndexCategory,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                    ),
                    onChanged: (dynamic newValue) {
                      setState(() {
                        selectedIndexCategory = newValue;
                      });
                    },
                    items: listOfCategory.map((category) {
                      return DropdownMenuItem(
                        child: Text(category),
                        value: category,
                      );
                    }).toList(),
                  ),
                ),
                _textpassword(context, (value) {}),
                _buildbutton(
                    context, "SignUp", Colors.white, kPrimaryColor, "/signup"),
                SizedBox(height: size.height * 0.03),
                _reasonregistraion(context, "/login"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
