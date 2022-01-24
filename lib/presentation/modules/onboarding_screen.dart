import 'package:flutter/material.dart';
import 'package:food365/presentation/modules/dashboard/account_type.dart';
import 'package:food365/presentation/modules/home/home_screen.dart';
import 'package:food365/presentation/modules/ordering/menu/menu_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Burger o Clock",
                style: TextStyle(fontSize: 32),
              ),
               InkWell(
                child: const Text(
                  "Open Staff Dashboards",
                  style: TextStyle(fontSize: 24),
                ),
                onTap: (){
                  Navigator.of(context).pushReplacementNamed(AccountType.id);
                },
              ),
              InkWell(
                child: const Text(
                  "Open Menu",
                  style: TextStyle(fontSize: 24),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(HomeScreen.id);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
