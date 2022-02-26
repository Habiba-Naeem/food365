import 'package:flutter/material.dart';
import 'package:food365/presentation/modules/Inventory/addProduct.dart';
import 'package:food365/presentation/modules/Inventory/manage_inventory.dart';


class AdminScreen extends StatelessWidget {
  static const String id = "Admin screen";
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
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
            color: Colors.blueAccent,
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
            color: Colors.blueAccent,
            textColor: Colors.white,
            onPressed: () {},
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
            color: Colors.blueAccent,
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
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddProduct()));
  }

  void _viewInventory(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Inventory()));

  }
}
