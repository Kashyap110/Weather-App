import 'dart:convert';
import 'package:climate_app/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
const api_key = 'b49a287b41fd7fe839ca60e203d74268';//take key from site

class Api {

  Future<Map<String, dynamic>> getData({required double lat, required double lon}) async {

    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$api_key&units=metric'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return {'Error': 'Error ala'};
    }
  }

  Future<Map<String, dynamic>> getDatabyCityName({required String Cname, required BuildContext context}) async {

    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$Cname&appid=$api_key&units=metric'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (_){
        return LoadingScreen();
      }));
      return {'Error': 'Error ala'};
    }
  }

}
