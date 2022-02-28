import 'package:flutter/material.dart';
import 'package:food365/presentation/modules/dashboard/account_type.dart';
import 'package:food365/presentation/modules/home/home_screen.dart';
import 'package:food365/presentation/modules/ordering/menu/menu_screen.dart';
import 'package:food365/presentation/utils/constants.dart';
import 'package:food365/presentation/shared/custom_appbar.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.teal,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Icon(
                Icons.fastfood_sharp,
                size: 50,
                color: Colors.white,
              ),
              Text(
                "Burger o Clock",
                style: TextStyle(fontSize: 50, color: Colors.white),
              ),
              SizedBox(
                height: 24,
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  child: const Text(
                    "Open Staff Dashboards",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(AccountType.id);
                  },
                ),
              ),
              InkWell(
                child: const Text(
                  "Open Menu",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(HomeScreen.id);
                },
              )
            ],
          ),
        ),
      ]),
    ));
  }
}
