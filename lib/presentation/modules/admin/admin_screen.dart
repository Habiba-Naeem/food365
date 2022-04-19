import 'package:flutter/material.dart';
import 'add_product/addProduct.dart';
import 'edit_product/editproduct_screen.dart';
import 'inventory/manage_inventory.dart';


class AdminScreen extends StatelessWidget {
  static const String id = "Admin screen";
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
          child: Column(children: <Widget>[
        Container(
          margin: EdgeInsets.all(35.0),
          padding: EdgeInsets.all(25.0),
          child: FlatButton(
            child: Text(
              'Manage Inventory',
              style: TextStyle(fontSize: 25.0),
            ),
            color: Colors.tealAccent,
            textColor: Colors.white,
            onPressed: () {
              _viewInventory(context);
            },
          ),
        ),
        Container(
          margin: EdgeInsets.all(35.0),
          padding: EdgeInsets.all(35.0),
          child: FlatButton(
            child: Text(
              'View All Products',
              style: TextStyle(fontSize: 25.0),
            ),
            color: Colors.tealAccent,
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditProductScreen()));
            },
          ),
        ),
        Container(
          margin: EdgeInsets.all(0.0),
          padding: EdgeInsets.all(35.0),
          child: FlatButton(
            child: Text(
              'Add New Product',
              style: TextStyle(fontSize: 25.0),
            ),
            color: Colors.tealAccent,
            textColor: Colors.white,
            onPressed: () {
              _addProduct(context);
            },
          ),
        ),
      ])),
    );
  }

  void _addProduct(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddProductScreen()));
  }

  void _viewInventory(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Inventory()));

  }
}
