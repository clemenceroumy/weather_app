import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import "../services/Location.dart";
import '../services/Icon.dart';

class Day extends StatefulWidget {
  @override
  _DayState createState() => _DayState();
}

class _DayState extends State<Day> {
  String city;
  double temperature;
  String date = DateFormat("EEEE,H:m").format(DateTime.now());
  String weatherStatus;
  List dataPrevisionHourly = [];

  @override
  initState() {
    super.initState();
    getWeather();
    getWeatherHourly();
  }

  Future<void> getWeather() {
    return Location.getWeather().then((value) {
      setState(() {
        city = value['name'];
        temperature = value['main']['temp'];
        weatherStatus = value['weather'][0]['main'];
        date = DateFormat("EEEE,H:m").format(DateTime.now());
      });
    });
  }

  Future<void> getWeatherHourly() {
    return Location.getWeatherHourly().then((value) {
      setState(() {
        dataPrevisionHourly = value["list"];
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
              dataPrevisionHourly.length != 0
                  ? WeatherIcon(dataPrevisionHourly[i]["weather"][0]['id'])
                  : Text(""),
              Text(
                dataPrevisionHourly.length != 0
                    ? dataPrevisionHourly[i]["dt_txt"]
                            .toString()
                            .split(" ")[1]
                            .split(":")[0] +
                        "H00"
                    : "null",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                  dataPrevisionHourly.length != 0
                      ? dataPrevisionHourly[i]["main"]['temp'].toString() + "°C"
                      : "null",
                  style: TextStyle(color: Colors.white))
            ],
          ),
        ),
      ));
    }
    return listColumn;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        Text(this.city != null ? this.city : "Indisponible",
                            style:
                                TextStyle(color: Colors.white, fontSize: 30)),
                      ],
                    ),
                    Text(this.date,
                        style: TextStyle(color: Colors.white70, fontSize: 20))
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
                    style: TextStyle(color: Colors.white, fontSize: 60))
              ],
            ),
          ),

          //ROW WEATHER STATUS
          Container(
            margin: EdgeInsets.only(top: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(this.weatherStatus.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 18))
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
    );
  }
}
