// ignore_for_file: deprecated_member_use

import 'package:climate_app/utilities/api.dart';
import 'package:climate_app/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utilities/weather_modal.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  Api service = Api();
   WeatherModal? model;
  TextEditingController controller = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              const Text(
                'Find Weather',
                style: kButtonTextStyle,
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                height: 90,
                child: CupertinoSearchTextField(
                  controller: controller,
                  backgroundColor: Colors.black,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          side: BorderSide(color: Colors.white))),
                  onPressed: () {
                    if (controller.text.length != 0) {
                      setState(() {
                        isLoading = false;
                      });
                      service
                          .getDatabyCityName(
                              context: context,
                              Cname: controller.text.toUpperCase())
                          .then((value){
                            print(value);
                            if(value['ERROR'] == "error ala" || value == null ){
                              model = null;
                            }else {
                              model = WeatherModal.fromJson(value);
                            }
                            setState(() {
                              isLoading = true;
                            });
                      });
                    }
                  },
                  child: Text("Get Weather"),
                ),
              ),
              SizedBox(
                height: 50,
              ),
             !isLoading ? SizedBox() : Column(
               children: [
                 Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      model == null ? Text( "No data Found",
                          style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))
                      :
                      Text(model!.temperature!.temp!.toStringAsFixed(0) + "°C",
                          style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),


                    ],
                  ),
                 Text(model!.weather![0].description!,
                   style: TextStyle(
                       fontSize: 50,
                       fontWeight: FontWeight.bold,
                       color:  Colors.black),
                 ),
               ],
             ),
            ],
          ),
        ),
      ),
    );
  }
}
