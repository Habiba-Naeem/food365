import 'package:flutter/material.dart';
import 'package:food365/domain/models/modules/ordering/order.dart';
import 'package:food365/domain/services/order_service.dart';
import 'package:food365/utils/shared/loading.dart';
import 'package:provider/provider.dart';

import '../../../../utils/colors.dart';
import 'CurrentOrders.dart';
import 'ServedOrders.dart';
import 'all_orders.dart';
import 'ready_orders.dart';

class WaiterDashboard extends StatelessWidget {
  static const String id = 'waiter dashboard';
  const WaiterDashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColor.primaryColor,
          title: Text('Kitchen'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.fastfood), text: "All Orders"),
              Tab(icon: Icon(Icons.add_alert), text: "Current Orders"),
               Tab(icon: Icon(Icons.add_alert), text: "Ready Orders"),
              Tab(icon: Icon(Icons.fastfood_rounded), text: "Orders Served")
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FutureProvider<List<OrderModel>>.value(
              initialData: [],
              value: OrderService().getAllOrders(),
              child: AllOrders(),
            ),
            FutureProvider<List<OrderModel>>.value(
              initialData: [],
             //value: null,
             // value: OrderService().getCurrentOrders(),
              child: CurrentOrders(),
            ),
            FutureProvider<List<OrderModel>>.value(
              initialData: [],
              //value: OrderService().getReadyOrders(),
              value: null,
              child: FutureBuilder(
                //future: OrderService().getReadyOrders(),
                builder: (context, snapshot) {
                  return snapshot.hasData ? ReadyOrders() : Loading();
                }
              ),
            ),
            FutureProvider<List<OrderModel>>.value(
              initialData: [],
              value: null,
              //value: OrderService().getServedOrders(),
              child: ServedOrders(),
            ),
          ],
        ),
      ),
    );
  }
}
