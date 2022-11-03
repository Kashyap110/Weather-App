import 'package:geolocator/geolocator.dart';
class Location {

    double? latitube;
    double? longitude;

    Future<void> getCurrentLocation() async {
    try {
      //async means we done process which can be faster ways not waiting for other task to complete
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      //await means wait upto the getting location then after we print the location
      latitube = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }

  }
}
