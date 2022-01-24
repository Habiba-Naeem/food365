import 'package:flutter/material.dart';
import 'package:food365/domain/modules/ordering/category.dart';

//THE DRAWRER ITEMS IN MENU WILL BE POPULATED FROM THE DATABASE
//MAKE SEPARATE CYSTOM DRAWER FOR STAFF OR NOT?

// FOR UNDERSTAND WHO HAS ACCESS TO THE CURRENT INSTANCE OF THE APPLICATION
// THEN POPULATE THE DRAWER ITEM WITH APPROPRIATE TEXT AND TAP

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
              ...categories.map(
                (category) {
                  return _DrawerItems(text: category.name, onTap: () {});
                },
              ),
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
