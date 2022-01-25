import 'package:flutter/material.dart';
import 'package:food365/domain/modules/ordering/menu_item_model.dart';
import 'package:food365/domain/modules/ordering/menu_item_model.dart';
import 'package:food365/presentation/modules/ordering/cart/cart_screen.dart';
import 'package:food365/presentation/shared/custom_bottom_nav_bar.dart';
import 'package:food365/presentation/shared/customsidedrawer.dart';
import 'package:food365/presentation/utils/constants.dart';

import 'menu_item.dart' as menuIemWidget;

class MenuScreen extends StatelessWidget {
  static const String id = 'menu screen';
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          title: Text("Menu"),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart_sharp),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.id);
              },
            )
          ],
        
        ),
      drawer: CustomSideDrawer(),
      bottomNavigationBar: CustomBottomNavBar(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          children: <Widget>[
            Divider(),
            MenuItems(),
          ],
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'MENU',
      style: headerStyle,
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
      children: [
        ...menuItems.map(
          (menuitem) => menuIemWidget.MenuItem(menuItem: menuitem),
        )
      ],
    ));
  }
}
