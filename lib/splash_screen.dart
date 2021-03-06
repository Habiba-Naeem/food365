// import 'package:flutter/material.dart';
// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:food365/presentation/modules/onboarding_screen.dart';

// void main() {
//   runApp(splash_screen());
// }

// class splash_screen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Food365',
//         home: AnimatedSplashScreen(
//             duration: 4000,
//             splash: 'assets/images/menu_items/Food365.png',
//             nextScreen: OnboardingScreen(),
//             splashTransition: SplashTransition.slideTransition,
//             //pageTransitionType: PageTransitionType.scale,
//             backgroundColor: Color.fromARGB(255, 230, 178, 214)));
//   }
// }

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

      backgroundColor: Colors.teal,
      title:  const Text(
        'Food365',
        textScaleFactor: 5,
        style: const TextStyle(color: Colors.white),
      ),
      image: Image.asset('assets/images/Food365 (3).png'),
      photoSize: 100.0,
      loaderColor: Colors.white,
    );
  }
}
