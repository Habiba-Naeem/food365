import 'package:flutter/material.dart';
import 'package:food365/domain/models/modules/ordering/cart_item.dart';
import 'package:food365/domain/models/modules/ordering/cart_model.dart';
import 'package:food365/domain/models/modules/ordering/menu_item_model.dart';
import 'package:food365/presentation/modules/ordering/cart/cart_screen.dart';
import 'package:food365/presentation/modules/ordering/menu/menu_item.dart';
import 'package:food365/presentation/shared/custom_appbar.dart';
import 'package:food365/presentation/shared/custom_bottom_nav_bar.dart';
import 'package:food365/presentation/shared/customsidedrawer.dart';
import 'package:food365/presentation/shared/loading.dart';
import 'package:food365/presentation/utils/constants.dart';

import 'package:food365/domain/services/menu_service.dart';
import 'package:provider/provider.dart';
import 'menu_item.dart' as menuIemWidget;

class MenuScreen extends StatelessWidget {
  static const String id = 'menu screen';
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBar(
        headingText: "Menu",
        height: 116.0,
      ),
      // appBar: AppBar(
      //   title: const Text("Menu"),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.shopping_cart_sharp),
      //       onPressed: () {
      //         Navigator.of(context).pushNamed(CartScreen.id);
      //       },
      //     )
      //   ],
      // ),
      drawer: CustomSideDrawer(),
      bottomNavigationBar: const CustomBottomNavBar(
        id: MenuScreen.id,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          children: <Widget>[
            const Divider(),
            //const MenuItems(),
            FutureProvider<List<MenuItemModel>>.value(
              initialData: [],
              value: MenuService().getMenuItems(),
              child: MenuItems(),
            ),
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
    final newmenuItems = Provider.of<List<MenuItemModel>>(context);
    print(newmenuItems);
    return Expanded(
      child: GridView.count(
        childAspectRatio: 0.65,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        crossAxisCount: 2,
        physics: const BouncingScrollPhysics(),
        children: [
          ...newmenuItems.map(
            (e) => FutureBuilder(
              future: MenuService().getMenuItems(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? menuIemWidget.MenuItem(
                        menuItem: e,
                      )
                    : Loading();
              },
            ),
          )
        ],
      ),
    );
  }
}
