import 'package:flutter/material.dart';
import 'package:food365/domain/models/modules/ordering/category.dart';
import 'package:food365/domain/services/menu_service.dart';
import 'package:food365/presentation/modules/ordering/cart/cart_item.dart';
import 'package:food365/presentation/modules/ordering/cart/cart_screen.dart';
import 'package:food365/utils/shared/category_card.dart';
import 'package:food365/utils/shared/custom_appbar.dart';
import 'package:food365/utils/shared/custom_bottom_nav_bar.dart';
import 'package:food365/utils/shared/customsidedrawer.dart';

//SINCE THE MENU WILL BE CUSTOMIZABLE BY THE ADMIN THEREFORE WE
//NEED TO FETCH MENU ITEMS FROM DATABASE ONCE THE APPLICATION STARTS
//USE THAT DYNAMIC DATA TO FILL THE MENU

class HomeScreen extends StatelessWidget {
  static const String id = 'home';

  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const CustomSideDrawer(),
        bottomNavigationBar: const CustomBottomNavBar(
          id: HomeScreen.id,
        ),
        appBar: MyCustomAppBar(
          headingText: "Home",
      height: 0,
      ),
     
        body: Padding(padding: const EdgeInsets.only(top: 24.0),
                
          child: Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CategoryChoiceChip(
                  category: categories[index],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
