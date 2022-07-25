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
import 'package:food365/utils/custom_style.dart';
import 'package:food365/utils/strings.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      useLoader: true,
      styleTextUnderTheLoader: TextStyle(),
      loadingText: Text(""),
      loadingTextPadding:EdgeInsets.zero,
      navigateAfterSeconds: new OnboardingScreen(),

      backgroundColor: Colors.teal,
      title:  Text(
        Strings.appName,
        textScaleFactor: 5,
        style: CustomStyle.headingStyle,
      ),
      image: Image.asset(Strings.logoUri),
      photoSize: 100.0,
      loaderColor: Colors.white,
    );
  }
}
