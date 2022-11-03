// ignore_for_file: deprecated_member_use

import 'package:climate_app/screens/city_screen.dart';
import 'package:climate_app/utilities/constants.dart';
import 'package:climate_app/utilities/weather_modal.dart';
import 'package:flutter/material.dart';
import 'loading_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({Key? key, required this.modal}) : super(key: key);
  WeatherModal modal ;
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_){
                        return  LoadingScreen();
                      }));
                    },
                    child: const Icon(Icons.near_me, size: 50.0),
                  ),
                  FlatButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_){
                          return const CityScreen();
                        }));
                      },
                      child: const Icon(
                        Icons.location_city,
                        size: 50.0,
                      ))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children:  [
                      Text(widget.modal.temperature!.temp!.toStringAsFixed(0)+"°C", style: kTempTextStyle),
                    ],
                  ),
                  Text(
                    widget.modal.name!,style: kTempTextStyle),
                  Text(
                    widget.modal.weather![0].description!,
                    style: kMessageTextStyle,
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
