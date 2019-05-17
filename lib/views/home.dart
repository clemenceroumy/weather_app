import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Color(0xFF0000d6),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: Color(0xFFFFDE03),
                  height: 500,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[Text("test")],
                  ),
                ),
                Container(
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[Text("yo!")],
                    ))
              ],
            ),
          )),
    );
  }
}
