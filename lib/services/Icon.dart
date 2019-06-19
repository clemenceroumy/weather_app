import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final int weatherId;

  WeatherIcon(this.weatherId);

  @override
  Widget build(BuildContext context) {
    switch (this.weatherId.toString()[0]) {
      case "2":
        {
          return Image.asset('assets/Icons/weather-lightning.png');
        }
        break;

      case "3":
        {
          return Image.asset('assets/Icons/weather-pouring.png');
        }
        break;

      case "5":
        {
          return Image.asset('assets/Icons/weather-pouring.png');
        }
        break;

      case "6":
        {
          return Image.asset('assets/Icons/weather-snowy.png');
        }
        break;

      case "7":
        {
          return Image.asset('assets/Icons/weather-fog.png');
        }
        break;

      case "8":
        {
          return Image.asset('assets/Icons/weather-sunny.png');
        }
        break;

      default:
        {
          return Image.asset('assets/Icons/weather-cloudy.png');
        }
        break;
    }
  }
}
