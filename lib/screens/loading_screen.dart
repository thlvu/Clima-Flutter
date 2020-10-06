import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    LocationPermission locationPermission = await checkPermission();
    switch (locationPermission) {
      case LocationPermission.denied:
      case LocationPermission.deniedForever:
        {
          locationPermission = await requestPermission();
          break;
        }
      case LocationPermission.always:
      case LocationPermission.whileInUse:
      default:
        break;
    }

    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(position);
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
