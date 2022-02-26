import 'package:flutter/material.dart';
import 'package:food365/domain/services/order_service.dart';
import 'package:food365/presentation/modules/KitchenStaff/CurrentOrders.dart';
import 'package:food365/presentation/modules/KitchenStaff/ServedOrders.dart';

class CookScreen extends StatelessWidget {
  static const String id = "cook screen";
  const CookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Kitchen'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.add_alert), text: "Current Orders"),
              Tab(icon: Icon(Icons.fastfood_rounded), text: "Orders Served")
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CurrentOrders(),
            ServedOrders(),
          ],
        ),
      ),
    );
  }
}
