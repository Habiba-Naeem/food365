import 'package:flutter/material.dart';
import 'package:food365/domain/services/menu_service.dart';
import 'package:food365/presentation/modules/home/home_screen.dart';
import 'package:food365/presentation/modules/onboarding_screen.dart';
import 'package:food365/presentation/modules/ordering/checkout/checkout_screen.dart';
import 'package:food365/presentation/shared/loading.dart';
//Remove this future on getMenuItems
class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: MenuService().getMenuItems(),
        builder: (context, snapshot) {
          print(snapshot);
          return snapshot.hasData ? OnboardingScreen() : Loading();
        });
  }
}
