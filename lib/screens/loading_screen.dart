
import 'package:climate_app/utilities/weather_modal.dart';
import 'package:flutter/material.dart';
import 'package:climate_app/services/location.dart';
import 'location_screen.dart';
import '../utilities/api.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Api service = Api();
  late WeatherModal model;
  Location location = Location();


  @override
  void initState() {
    getLocation();
    super.initState();
  }

  void getLocation() {
    location.getCurrentLocation().then((value) {
      service
          .getData(
              lat: location.latitube ?? 0.0, lon: location.longitude ?? 0.0)
          .then((value) {
        model = WeatherModal.fromJson(value);
        setState(() {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return LocationScreen(modal: model,);
          }));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: SpinKitFadingCircle(
            size: 70,
            color: Colors.white,
          )
      ),
    );
  }
}
