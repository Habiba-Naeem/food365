import 'package:flutter/material.dart';
import 'package:food365/presentation/dashboard/account_type.dart';
import 'package:food365/presentation/modules/ordering/menu/menu_screen.dart';
import 'package:food365/utils/colors.dart';
import 'package:food365/utils/custom_style.dart';
import 'package:food365/utils/strings.dart';

import 'ordering/home/home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Image.asset(Strings.logoUri),
              // Text(
              //  Strings.appName,
              //   style: CustomStyle.headingStyle,
              // ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    serviceCard(context, "Staff Dashboard", AccountType.id),
                    SizedBox(
                      width: 20,
                    ),
                    serviceCard(context, "Menu", HomeScreen.id),
                  ],
                ),
              ),
              // Align(
              //   alignment: Alignment.center,
              //   child: InkWell(
              //     child: const Text(
              //       "Open Staff Dashboards",
              //       style: TextStyle(fontSize: 24, color: Colors.white),
              //     ),
              //     onTap: () {
              //       Navigator.of(context).pushNamed(AccountType.id);
              //     },
              //   ),
              // ),
              // InkWell(
              //   child: const Text(
              //     "Open Menu",
              //     style: TextStyle(fontSize: 24, color: Colors.white),
              //   ),
              //   onTap: () {
              //     Navigator.of(context).pushNamed(HomeScreen.id);
              //     //Navigator.of(context).pushReplacementNamed(HomeScreen.id);
              //   },
              // )
            ],
          ),
        ),
      ]),
    ));
  }

  Widget serviceCard(context, String name, String id) {
    //bool isActive = active == item["key"];
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(id);

          // setActive(item["key"]);
          // Future.delayed(Duration(milliseconds: 350), () {
          //   nextPage();
          // });
        },
        child: AnimatedContainer(
          height: 100,
          duration: Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: CustomColor.primaryColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SvgPicture.asset(
              //   item["icon"],
              //   color: isActive ? Colors.white : null,
              // ),
              SizedBox(
                height: 5.0,
              ),
              Text(name, style: CustomStyle.appbarTitleStyle)
            ],
          ),
        ),
      ),
    );
  }
}
