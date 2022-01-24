import 'package:flutter/material.dart';
import 'package:food365/presentation/shared/custom_bottom_nav_bar.dart';
import 'package:food365/presentation/shared/customsidedrawer.dart';

import 'menu_item.dart';

class MenuScreen extends StatelessWidget {
  static const String id = 'menu screen';
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomSideDrawer(),
    bottomNavigationBar: CustomBottomNavBar(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          children: <Widget>[
            //  buildAppBar(),
            //  buildFoodFilter(),
            Divider(),
            //buildFoodList(),
            MenuItems()
          ],
        ),
      ),
    );
  }
}

class MenuItems extends StatelessWidget {
  const MenuItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.count(
      childAspectRatio: 0.65,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      crossAxisCount: 2,
      physics: BouncingScrollPhysics(),
      children: [MenuItem(), MenuItem(), MenuItem()],
    ));
  }
}
