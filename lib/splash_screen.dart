
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food365/presentation/modules/onboarding_screen.dart';
import 'package:splashscreen/splashscreen.dart';



class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new OnboardingScreen(),
      
      backgroundColor: Colors.white,
      title: new Text(
        'Food365',
        textScaleFactor: 5,
      ),
      image: new Image.network(''),
      loadingText: Text("Loading"),
      photoSize: 100.0,
      loaderColor: Colors.black,
    );
  }
}
