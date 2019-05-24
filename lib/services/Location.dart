import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import "../utils/api_key.dart";

class Location {
  ///Get the location of the user
  static Future getPosition() async {
    Position position;

    try {
      position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      position = null;
    }

    return jsonEncode({
      "lat": position.latitude.toString(),
      "long": position.longitude.toString()
    });
  }

  ///Get the current weather
  static Future getWeather() async {
    var location = await getPosition();
    location = jsonDecode(location);
    var response = await http.get(
        'http://api.openweathermap.org/data/2.5/weather?lat=' +
            location["lat"] +
            '&lon=' +
            location['long'] +
            '&units=metric' +
            '&appid=' +
            ApiKey.weatherApi);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return "something went wrong";
    }
  }

  static Future getWeatherHourly() async {
    var location = await getPosition();
    location = jsonDecode(location);
    var response = await http.get(
        'http://api.openweathermap.org/data/2.5/forecast?lat=' +
            location["lat"] +
            '&lon=' +
            location['long'] +
            '&units=metric' +
            '&appid=' +
            ApiKey.weatherApi);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return "something went wrong";
    }
  }
}
