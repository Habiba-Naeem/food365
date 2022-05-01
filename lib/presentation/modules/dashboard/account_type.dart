import 'package:flutter/material.dart';
import 'package:food365/presentation/modules/admin/admin_screen.dart';
import 'package:food365/presentation/modules/KitchenStaff/cook_screen.dart';
import 'package:food365/presentation/modules/ordering/menu/menu_screen.dart';
import 'package:food365/presentation/modules/staff/waiter/waiter_dashboard.dart';
import 'package:food365/utils/constants.dart';


class AccountType extends StatelessWidget {
  static const String id = 'account type';
  const AccountType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
backgroundColor: Color.fromARGB(230, 255, 255, 255),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Text('Food365', style: headerStyle),
                ),
              ),
              Expanded(
                child: InkWell(
                  child: const Text(
                    "Waiter",
                    style: TextStyle(fontSize: 24),
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(WaiterDashboard.id);
                  },
                ),
              ),
              Expanded(
                child: InkWell(
                  child: const Text(
                    "Cook",
                    
                    style: TextStyle(fontSize: 24),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(CookScreen.id);
                  },
                ),
              ),
              Expanded(
                child: InkWell(
                  child: const Text(
                    "Manager",
                    style: TextStyle(fontSize: 24),
                  ),
                  onTap: () {},
                ),
              ),
              Expanded(
                child: InkWell(
                  child: const Text(
                    "Admin",
                    style: TextStyle(fontSize: 24),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(AdminScreen.id);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}




