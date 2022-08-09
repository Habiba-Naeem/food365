import 'package:flutter/material.dart';
import 'package:food365/presentation/modules/admin/admin_screen.dart';
import 'package:food365/presentation/modules/KitchenStaff/cook_screen.dart';
import 'package:food365/presentation/modules/admin/auth/auth.dart';
import 'package:food365/presentation/modules/ordering/menu/menu_screen.dart';
import 'package:food365/presentation/modules/staff/waiter/waiter_dashboard.dart';
import 'package:food365/utils/constants.dart';

import '../../utils/colors.dart';
import '../../utils/custom_style.dart';
import '../../utils/strings.dart';

class AccountType extends StatelessWidget {
  static const String id = 'account type';
  const AccountType({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.teal,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(Strings.logoUri),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    serviceCard(context, "Admin",Authenticate.id),
                    // SizedBox(
                    //   width: 20,
                    // ),
                    // serviceCard(context, "Cook", CookScreen.id),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    serviceCard(context, "Waiter", WaiterDashboard.id),
                    SizedBox(
                      width: 20,
                    ),
                    serviceCard(context, "Cook", CookScreen.id),
                  ],
                ),
              ),
              // Align(
              //   alignment: Alignment.topCenter,
              //   child: Padding(
              //     padding: const EdgeInsets.only(top: 24.0),
              //     child: Text('Food365', style: headerStyle),
              //   ),
              // ),
              // Container(
              //   child: Column(
              //     children: [
              //       InkWell(
              //         child: const Text(
              //           "Waiter",
              //           style: TextStyle(fontSize: 24),
              //         ),
              //         onTap: () {
              //           Navigator.of(context).pushNamed(WaiterDashboard.id);
              //         },
              //       ),
              //       InkWell(
              //         child: const Text(
              //           "Cook",
              //           style: TextStyle(fontSize: 24),
              //         ),
              //         onTap: () {
              //           Navigator.of(context).pushNamed(CookScreen.id);
              //         },
              //       ),
              //       InkWell(
              //         child: const Text(
              //           "Admin",
              //           style: TextStyle(fontSize: 24),
              //         ),
              //         onTap: () {
              //           Navigator.of(context).pushNamed(Authenticate.id);
              //         },
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
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
