import 'package:flutter/material.dart';
import 'package:food365/domain/models/modules/ordering/order.dart';
import 'package:food365/domain/services/order_service.dart';
import 'package:food365/presentation/modules/KitchenStaff/CurrentOrders.dart';
import 'package:food365/presentation/modules/KitchenStaff/ServedOrders.dart';
import 'package:food365/presentation/modules/KitchenStaff/all_orders.dart';
import 'package:food365/presentation/modules/KitchenStaff/ready_orders.dart';
import 'package:food365/utils/shared/loading.dart';
import 'package:provider/provider.dart';

class CookScreen extends StatelessWidget {
  static const String id = "cook screen";
  const CookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
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
<<<<<<< HEAD
            //  FutureProvider.value(
            //     //initialData: [],
            //     value: OrderService().getbyRef(),
            //     child: AllOrders(),
            //   ),
            FutureProvider<List<OrderModel>>.value(
              initialData: [],
              value: OrderService().getAllOrders(),
              child: AllOrders(),
            ),
            FutureProvider<List<OrderModel>>.value(
              initialData: [],
              value: OrderService().getCurrentOrders(),
              child: CurrentOrders(),
            ),

            FutureProvider<List<OrderModel>>.value(
              initialData: [],
              value: OrderService().getReadyOrders(),
              child: FutureBuilder(
                  future: OrderService().getReadyOrders(),
                  builder: (context, snapshot) {
                    return snapshot.hasData ? ReadyOrders() : Loading();
                  }),
            ),
            FutureProvider<List<OrderModel>>.value(
              initialData: [],
              value: OrderService().getServedOrders(),
              child: ServedOrders(),
            ),
=======
            
            // FutureProvider<List<OrderModel>>.value(
            //   initialData: [],
            //   value: OrderService().getAllOrders(),
            //   child: AllOrders(),
            // ),
            StreamBuilder<List<OrderModel>>(
              stream: OrderService().getOrderStream(),
              builder: (context, snapshot) {
                return StreamProvider<List<OrderModel>>.value(
                  initialData:[],
                  value: OrderService().getOrderStream(),
                  child: AllOrders(),
                );
              }
            ),
            // FutureProvider<List<OrderModel>>.value(
            //   initialData: [],
            //   value: OrderService().getCurrentOrders(),
            //   child: CurrentOrders(),
            // ),
            StreamBuilder<List<OrderModel>>(
              stream: OrderService().getCookingOrdersStream(),
              builder: (context, snapshot) {
                return StreamProvider<List<OrderModel>>.value(
                  initialData:[],
                  value: OrderService().getCookingOrdersStream(),
                  child:CurrentOrders(),
                );
              }
            ),
            StreamBuilder<List<OrderModel>>(
              stream: OrderService().getReadyOrdersStream(),
              builder: (context, snapshot) {
                return StreamProvider<List<OrderModel>>.value(
                  initialData:[],
                  value: OrderService().getReadyOrdersStream(),
                  child: ReadyOrders(),
                );
              }
            ),
            StreamBuilder<List<OrderModel>>(
              stream: OrderService().getServedOrdersStream(),
              builder: (context, snapshot) {
                return StreamProvider<List<OrderModel>>.value(
                  initialData:[],
                  value: OrderService().getServedOrdersStream(),
                  child: ServedOrders(),
                );
              }
            ),

            // FutureProvider<List<OrderModel>>.value(
            //   initialData: [],
            //   value: OrderService().getReadyOrders(),
            //   child: FutureBuilder(
            //       future: OrderService().getReadyOrders(),
            //       builder: (context, snapshot) {
            //         return snapshot.hasData ? ReadyOrders() : Loading();
            //       }),
            // ),
            // FutureProvider<List<OrderModel>>.value(
            //   initialData: [],
            //   value: OrderService().getServedOrders(),
            //   child: ServedOrders(),
            // ),
>>>>>>> 1d5514c5d324d9606f680178dad275e491162890
          ],
        ),
      ),
    );
  }
}
