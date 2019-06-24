import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../views/day.dart';
import "../views/week.dart";
import "../utils/colors.dart";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: Palette.gradient,
          child: SafeArea(
            //child: RefreshIndicator(
            //onRefresh: getWeather ,
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: <Widget>[
                //Big screen row
                Day(),

                //Bottom screen
                Week()
              ],
            ),
          )),
    );
  }
}
