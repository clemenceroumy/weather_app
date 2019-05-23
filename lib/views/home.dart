import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import "../services/Location.dart";
import "../utils/colors.dart";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String city;
  double temperature;
  String date = DateFormat("EEEE,H:m").format(DateTime.now());

  @override
  initState() {
    super.initState();
    getWeather();
  }

  Future<void> getWeather() {
    return Location.getWeather().then((value) {
      setState(() {
        city = value['name'];
        temperature = value['main']['temp'];
        date = DateFormat("EEEE,H:m").format(DateTime.now());
      });
    });
  }

  ///Generate 5 columns for the hours prevision
  List<Expanded> generateColumn() {
    List<Expanded> listColumn = new List<Expanded>();

    for (var i = 1; i < 6; i++) {
      listColumn.add(Expanded(
        child: Container(
          child: Column(
            children: <Widget>[
              Icon(
                Icons.cloud,
                color: Colors.white,
              ),
              Text(
                '10:00',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ));
    }
    return listColumn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: Palette.gradient,
          child: SafeArea(
              child: RefreshIndicator(
            onRefresh: getWeather,
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
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
                        padding: EdgeInsets.fromLTRB(0, 20, 30, 0),
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
                        margin: EdgeInsets.only(top: 50.0),
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
                                    Text(
                                        this.city != null
                                            ? this.city
                                            : "Indisponible",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 30)),
                                  ],
                                ),
                                Text(this.date,
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 20))
                              ],
                            )
                          ],
                        ),
                      ),

                      //ROW DEGREE
                      Container(
                        margin: EdgeInsets.only(top: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(this.temperature.toString() + "°C",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 60))
                          ],
                        ),
                      ),

                      //ROW WEATHER STATUS
                      Container(
                        margin: EdgeInsets.only(top: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text('Cloudy',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18))
                          ],
                        ),
                      ),

                      //ROW HOURS PREVISIONS
                      Container(
                        margin: EdgeInsets.only(top: 50.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: this.generateColumn(),
                        ),
                      )
                    ],
                  ),
                ),

                //Bottom screen
                Container(
                    height: 300,
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[Text("yo!")],
                    ))
              ],
            ),
          ))),
    );
  }
}
