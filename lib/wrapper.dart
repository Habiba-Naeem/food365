import 'package:flutter/material.dart';

import 'presentation/modules/onboarding_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnboardingScreen();
    // return FutureBuilder(
    //     future: MenuService().getMenuItems(),
    //     builder: (context, snapshot) {
    //       return snapshot.hasData ? const OnboardingScreen() : SplashScreenPage();
    //     });
  }
}
