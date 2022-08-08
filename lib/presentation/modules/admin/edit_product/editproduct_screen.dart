// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:food365/domain/models/modules/ordering/cart_item.dart';
import 'package:food365/domain/models/modules/ordering/cart_model.dart';
import 'package:food365/domain/models/modules/ordering/menu_item_model.dart';
import 'package:food365/presentation/modules/admin/edit_product/edit_product_item.dart';
import 'package:food365/presentation/modules/ordering/cart/cart_screen.dart';
import 'package:food365/presentation/modules/ordering/menu/menu_item.dart';
import 'package:food365/domain/services/menu_service.dart';
import 'package:food365/utils/shared/custom_appbar.dart';
import 'package:food365/utils/shared/loading.dart';
import 'package:provider/provider.dart';

class EditProductScreen extends StatelessWidget {
  static const String id = 'menu screen';
  const EditProductScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBar(
        headingText: "Your Products",
        height: 116.0,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          children: <Widget>[
            const Divider(),
            StreamProvider<List<MenuItemModel>>.value(
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

class MenuItems extends StatelessWidget {
  const MenuItems({Key key}) : super(key: key);

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
            (e) => StreamBuilder(
              stream: MenuService().getMenuItems(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? EditProductItem(
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


// class EditProductScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Center(
//           child: const Text('Edit Product'),
//         ),
//       ),
//       body: ListView(
//         children: <Widget>[
//           Container(
//             height: 250,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Colors.teal.shade100,
//                   Colors.teal.shade50
//                 ],
//                 begin: Alignment.centerLeft,
//                 end: Alignment.centerRight,
//                 stops: [
//                   0.5,
//                   0.9
//                 ],
//               ),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: <Widget>[
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(5.0), //or 15.0
//                       child: Container(
//                         height: 30.0,
//                         width: 30.0,
//                         color: Colors.cyan[800],
//                         child: Icon(Icons.delete, color: Colors.white, size: 25.0),
//                       ),
//                     ),
//                     CircleAvatar(
//                       backgroundColor: Colors.white,
//                       minRadius: 75.0,
//                       child: CircleAvatar(
//                         radius: 0.0,
//                        // backgroundImage: NetworkImage(''),
//                       ),
//                     ),
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(5.0), //or 15.0
//                       child: Container(
//                         height: 30.0,
//                         width: 30.0,
//                         color: Colors.cyan[800],
//                         child: Icon(Icons.edit, color: Colors.white, size: 25.0),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   'Product Name',
//                   style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Text(
//                   'Category',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 22,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                   child: Container(
//                     color: Colors.teal,
//                     child: ListTile(
//                       title: Text(
//                         '0PKR',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                           color: Colors.white,
//                         ),
//                       ),
//                       subtitle: Text(
//                         'Price',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.white70,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             child: Column(
//               children: <Widget>[
//                 ListTile(
//                   title: Text(
//                     'Description',
//                     style: TextStyle(
//                       color: Colors.teal,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   subtitle: Text(
//                     'Lorem Ipsum hdhshdjahdau haeguaheiuarh bdhdsahs',
//                     style: TextStyle(
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//                 Divider(),
//                 ListTile(
//                   title: Text(
//                     'Category',
//                     style: TextStyle(
//                       color: Colors.teal,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   subtitle: Text(
//                     'Foods',
//                     style: TextStyle(
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(25),
//                   child: FlatButton(
//                     child: Text(
//                       'Save',
//                       style: TextStyle(fontSize: 20.0),
//                     ),
//                     color: Colors.blueAccent,
//                     textColor: Colors.white,
//                     onPressed: () {},
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
