import 'package:flutter/material.dart';
import 'package:food365/presentation/modules/home/home_screen.dart';
import 'package:food365/presentation/modules/ordering/menu/menu_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
   // required this.selectedMenu,
  }) : super(key: key);

 // final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home_outlined),
                onPressed: () =>
                    Navigator.pushNamed(context, HomeScreen.id),
              ),
              IconButton(
                icon: Icon(Icons.dining_outlined),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart_outlined),
                onPressed: () {},
              ),
            ],
          )),
    );
  }
}