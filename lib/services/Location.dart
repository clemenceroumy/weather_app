import 'package:geolocator/geolocator.dart';

class Location {
  ///Get the location of the user
  static Future<String> getPosition() async {
    String location;

    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemark = await Geolocator()
          .placemarkFromCoordinates(position.latitude, position.longitude);

      location = placemark[0].locality;
    } catch (e) {
      location = null;
    }

    return location;
  }
}
