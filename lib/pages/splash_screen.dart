import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_api/constants/images.dart';
import 'package:weather_app_api/pages/home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState(){
    super. initState();
    Timer(Duration(seconds: 3),(){
      ///After 3 seconds it will move to home screen
      Get.off(HomeScreen());
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              splash_screen,
            ),
            Text('"Weather is always unrehearsed."',style: TextStyle(
                fontFamily: 'SFProText',
                fontSize: 19,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
            SizedBox(height: 50,),
            CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)),
          ],
        ),
      ),
    );
  }
}
