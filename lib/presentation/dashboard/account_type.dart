import 'package:flutter/material.dart';
import 'package:food365/presentation/modules/admin/admin_screen.dart';
import 'package:food365/presentation/modules/KitchenStaff/cook_screen.dart';
import 'package:food365/presentation/modules/admin/auth/auth.dart';
import 'package:food365/presentation/modules/ordering/menu/menu_screen.dart';
import 'package:food365/presentation/modules/staff/waiter/waiter_dashboard.dart';
import 'package:food365/utils/constants.dart';

class AccountType extends StatelessWidget {
  static const String id = 'account type';
  const AccountType({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Text('Food365', style: headerStyle),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    InkWell(
                      child: const Text(
                        "Waiter",
                        style: TextStyle(fontSize: 24),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(WaiterDashboard.id);
                      },
                    ),
                    InkWell(
                      child: const Text(
                        "Cook",
                        style: TextStyle(fontSize: 24),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(CookScreen.id);
                      },
                    ),
                    InkWell(
                      child: const Text(
                        "Admin",
                        style: TextStyle(fontSize: 24),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(Authenticate.id);
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
