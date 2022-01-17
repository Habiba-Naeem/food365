
import 'package:flutter/material.dart';

class CustomSideDrawer extends StatelessWidget {
  const CustomSideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          _DrawerItems(text: "Current Orders", onTap: () {}),
          SizedBox(
            height: 18,
          ),
          _DrawerItems(text: "Served Orders", onTap: () {}),
          SizedBox(
            height: 18,
          ),
          _DrawerItems(text: "Seating", onTap: () {}),
         
        ]),
      ),
    );
  }
}

class _DrawerItems extends StatelessWidget {
  final String text;
  final Function onTap;
  const _DrawerItems({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    );
  }
}
