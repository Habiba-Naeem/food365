import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:food365/presentation/modules/home/home_screen.dart';

class splash_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Food365',
        home: AnimatedSplashScreen(
            duration: 4000,
            splash: 'assets/images/menu_items/Food365.png',
            nextScreen: HomeScreen(),
            splashTransition: SplashTransition.slideTransition,
            //pageTransitionType: PageTransitionType.scale,
            backgroundColor: Color.fromARGB(255, 230, 178, 214)));
  }
}
