import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import "utils/colors.dart";

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
            child: Column(
              children: <Widget>[
                //Big screen row
                Container(
                  height: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      //ROW BUTTONS
                      Container(
                        color: Colors.black12,
                        padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Icon(
                              Icons.add,
                              color: Colors.white70,
                            )
                          ],
                        ),
                      ),

                      //ROW CITY/HOURS
                      Container(
                        color: Colors.black12,
                        margin: EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.place,
                                      color: Colors.white,
                                    ),
                                    Text("LE LUDE",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 30)),
                                  ],
                                ),
                                Text("Samedi, 17:24",
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 20))
                              ],
                            )
                          ],
                        ),
                      ),

                      //ROW DEGREE
                      Container(
                        color: Colors.black12,
                        margin: EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text('-1°C',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 60))
                          ],
                        ),
                      ),

                      //ROW WEATHER STATUS
                      Container(
                        color: Colors.black12,
                        margin: EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text('Cloudy',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18))
                          ],
                        ),
                      ),

                      //ROW ALL DAY
                      Container(
                        color: Colors.black12,
                        margin: EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                color: Colors.white24,
                                child: Column(
                                  children: <Widget>[Text('1')],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.white24,
                                child: Column(
                                  children: <Widget>[Text('2')],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                //Bottom screen
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
