import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';

import "../utils/colors.dart";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Geolocator geolocator = Geolocator();

  @override
  initState() {
    super.initState();
    this.getPosition();
  }

  ///Get the location of the user
  Future<String> getPosition() async {
    String location;

    try {
      Position position = await geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemark = await geolocator.placemarkFromCoordinates(
          position.latitude, position.longitude);

      location = placemark[0].locality;
    } catch (e) {
      location = null;
    }
    print(location);
    return location;
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
            child: Column(
              children: <Widget>[
                //Big screen row
                Container(
                  height: 450,
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
                        margin: EdgeInsets.only(top: 30.0),
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
