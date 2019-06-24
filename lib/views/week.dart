import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Week extends StatefulWidget {
  @override
  _WeekState createState() => _WeekState();
}

class _WeekState extends State<Week> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
          color: Colors.white,
        ),
        height: 300,
        child: Row(
          children: <Widget>[Text("yo!")],
        ));
  }
}
