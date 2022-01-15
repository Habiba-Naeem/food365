import 'package:flutter/material.dart';
import 'package:food365/presentation/modules/order/menu.dart';

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
                  Navigator.of(context).pushReplacementNamed(Menu.id);
                },
              ),
              InkWell(
                child: const Text(
                  "Cook",
                  style: TextStyle(fontSize: 24),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(Menu.id);
                },
              ),
              InkWell(
                child: const Text(
                  "Manager",
                  style: TextStyle(fontSize: 24),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(Menu.id);
                },
              ),
              InkWell(
                child: const Text(
                  "Admin",
                  style: TextStyle(fontSize: 24),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(Menu.id);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
