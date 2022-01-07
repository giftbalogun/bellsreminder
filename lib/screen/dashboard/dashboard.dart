// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bellsreminder/auth/login.dart';
import 'package:bellsreminder/skin/card_courses.dart';
import 'package:bellsreminder/skin/constants.dart';
import 'package:bellsreminder/skin/header.dart';
import 'package:flutter/material.dart';

import 'utils/LearnerBottomNavigationBar.dart';
import 'utils/LearnerImages.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final TextEditingController _searchControl = TextEditingController();
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
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
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: Constants.mainPadding,
                    vertical: Constants.mainPadding),
                height: 44,
                width: 44,
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  color: Colors.white.withOpacity(0.3),
                  child: Icon(Icons.menu, color: Colors.white),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: () {
                    debugPrint("Menu pressed");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(context) {
    return Stack(
      children: <Widget>[
        Header(),
        Padding(
          padding: EdgeInsets.all(Constants.mainPadding),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              SizedBox(height: Constants.mainPadding * 2),

              // 1. Welcome User
              Text(
                "Welcome back\nStudent!",
                style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),

              SizedBox(height: Constants.mainPadding),

              // 2. Search Textfield
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: TextField(
                  focusNode: myFocusNode,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Constants.textDark,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: "Search courses",
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Constants.textDark,
                      ),
                      onPressed: () {
                        debugPrint("Search pressed");
                      },
                    ),
                    hintStyle: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  maxLines: 1,
                  controller: _searchControl,
                ),
              ),

              SizedBox(height: Constants.mainPadding),

              // 3. Start Learning Button Section
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Color(0xFFFEF3F3),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Start Learning \nNew Stuff!",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Constants.textDark),
                        ),

                        SizedBox(height: 10.0),

                        // Categories Button
                        Container(
                          width: 150,
                          child: FlatButton(
                            padding: EdgeInsets.all(10.0),
                            color: Constants.salmonMain,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      "Courses Listed",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Icon(Icons.arrow_forward,
                                    color: Colors.white, size: 16),
                              ],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13.0),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, "/courselist");
                            },
                          ),
                        )
                      ],
                    ),
                  ),

                  // Image Researching Girl
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Image.asset(
                      "assets/dashboard/researching.png",
                      width: 200,
                      height: 104,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.0),

              Text("My Courses",
                  style: TextStyle(
                    color: Constants.textDark,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),

              SizedBox(height: 20.0),

              // List of courses
              ListView(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  CardCourses(
                    image: Image.asset("assets/dashboard/icon_1.png",
                        width: 40, height: 40),
                    color: Constants.lightPink,
                    title: "ICT-New Horizon",
                    hours: "10 hours, 19 lessons",
                    progress: "25%",
                    percentage: 0.25,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
