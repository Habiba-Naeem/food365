import 'package:flutter/material.dart';
import 'package:food365/domain/modules/ordering/category.dart';
import 'package:food365/domain/modules/ordering/menu_item_model.dart';
import 'package:food365/domain/services/menu_service.dart';
import 'package:food365/presentation/modules/ordering/cart/cart_items.dart';
import 'package:food365/presentation/modules/ordering/cart/cart_screen.dart';
import 'package:food365/presentation/shared/custom_bottom_nav_bar.dart';
import 'package:food365/presentation/shared/customsidedrawer.dart';

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
        drawer: CustomSideDrawer(),
        bottomNavigationBar: CustomBottomNavBar(),
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
      ),
    );
  }
}

// class MenuItem extends StatefulWidget {
//   List<MenuItem> menuItems;
//   MenuItem({Key? key, required this.menuItems}) : super(key: key);

//   @override
//   _MenuItemState createState() => _MenuItemState();
// }

// class _MenuItemState extends State<MenuItem> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       scrollDirection: Axis.vertical,
//       itemCount: menuItems.length,
//       itemBuilder: (BuildContext context, int i) {
//         return Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Text(menuItems[i].name),
//             SizedBox(
//               height: 20,
//             ),

//             //CHECK ALIGNMENT IF IT IS WORKING OR NOT
//             const Align(
//               alignment: Alignment.centerLeft,
//               child: Text("Rs 50"),
//             ),
//             Align(
//               alignment: Alignment.centerLeft,
//               child: IconButton(
//                 onPressed: () {},
//                 icon: const Icon(Icons.add),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
