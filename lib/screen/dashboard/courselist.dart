// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:bellsreminder/skin/card_courses.dart';
import 'package:bellsreminder/skin/constants.dart';
import 'package:bellsreminder/skin/header_inner.dart';
import 'package:flutter/material.dart';

class CourseList extends StatefulWidget {
  const CourseList({Key? key}) : super(key: key);

  @override
  _CourseListState createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  @override
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: new EdgeInsets.symmetric(
                    horizontal: Constants.mainPadding,
                    vertical: Constants.mainPadding),
                height: 44,
                width: 44,
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  color: Colors.white.withOpacity(0.3),
                  child: Icon(Icons.keyboard_backspace, color: Colors.white),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                margin: new EdgeInsets.symmetric(
                    horizontal: Constants.mainPadding,
                    vertical: Constants.mainPadding),
                height: 44,
                width: 44,
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  color: Colors.white.withOpacity(0.3),
                  child: Icon(Icons.menu, color: Colors.white),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  onPressed: () {
                    debugPrint("Menu Pressed");
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
        HeaderInner(),
        ListView(
          children: <Widget>[
            SizedBox(height: Constants.mainPadding * 3),
            Center(
              child: Text(
                "300 Level List",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: Constants.mainPadding * 2),
            Container(
              padding: EdgeInsets.fromLTRB(
                  Constants.mainPadding,
                  Constants.mainPadding * 2,
                  Constants.mainPadding,
                  Constants.mainPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
                color: Colors.white,
              ),
              child: ListView(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  CardCourses(
                    image: Image.asset("assets/dashboard/icon_1.png",
                        width: 40, height: 40),
                    color: Constants.lightPink,
                    title: "Adobe XD Prototyping",
                    hours: "10 hours, 19 lessons",
                    progress: "25%",
                    percentage: 0.25,
                  ),
                  CardCourses(
                    image: Image.asset("assets/dashboard/icon_1.png",
                        width: 40, height: 40),
                    color: Constants.lightPink,
                    title: "Adobe XD Prototyping",
                    hours: "10 hours, 19 lessons",
                    progress: "25%",
                    percentage: 0.25,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
