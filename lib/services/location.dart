import 'package:geolocator/geolocator.dart' as geolocator;

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      geolocator.Position location = await geolocator.getCurrentPosition(
          desiredAccuracy: geolocator.LocationAccuracy.low);
      latitude = location.latitude;
      longitude = location.longitude;
    } catch (e) {}
  }
}
