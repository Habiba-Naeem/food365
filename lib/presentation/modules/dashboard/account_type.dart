import 'package:flutter/material.dart';
import 'package:food365/presentation/modules/Inventory/admin_screen.dart';
import 'package:food365/presentation/modules/KitchenStaff/cook_screen.dart';
import 'package:food365/presentation/modules/ordering/menu/menu_screen.dart';
import 'package:food365/presentation/modules/staff/waiter/waiter_dashboard.dart';

class AccountType extends StatelessWidget {
  static const String id = 'account type';
  const AccountType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: const Text(
                  "Waiter",
                  style: TextStyle(fontSize: 24),
                ),
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(WaiterDashboard.id);
                },
              ),
              InkWell(
                child: const Text(
                  "Cook",
                  style: TextStyle(fontSize: 24),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(CookScreen.id);
                },
              ),
              InkWell(
                child: const Text(
                  "Manager",
                  style: TextStyle(fontSize: 24),
                ),
                onTap: () {},
              ),
              InkWell(
                child: const Text(
                  "Admin",
                  style: TextStyle(fontSize: 24),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(AdminScreen.id);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}




