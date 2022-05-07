import 'package:flutter/material.dart';
import 'package:food365/domain/models/modules/ordering/category.dart';
import 'package:food365/utils/constants.dart';
import 'package:food365/utils/shared/category_card.dart';
//THE DRAWRER ITEMS IN MENU WILL BE POPULATED FROM THE DATABASE
//MAKE SEPARATE CYSTOM DRAWER FOR STAFF OR NOT?

// FOR UNDERSTAND WHO HAS ACCESS TO THE CURRENT INSTANCE OF THE APPLICATION
// THEN POPULATE THE DRAWER ITEM WITH APPROPRIATE TEXT AND TAP

class CustomSideDrawer extends StatelessWidget {
  const CustomSideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: ListView.separated(
          itemCount: categories.length,
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 8.0,
            );
          },
          itemBuilder: (context, index) {
            return _DrawerItems(
                category: categories[index], gradient: gradients[index]);
          }),
    ));
    // child: Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
    //   child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         ...categories.map(
    //           (category) {
    //             return _DrawerItems(text: category.name, onTap: () {});
    //           },
    //         ),
    //       ]),
    // ),
  }
}

class _DrawerItems extends StatelessWidget {
  final Category category;
  final Gradient gradient;
  const _DrawerItems({Key? key, required this.category, required this.gradient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: CategoryChoiceChip(
      category: category,
    ));
  }
}
