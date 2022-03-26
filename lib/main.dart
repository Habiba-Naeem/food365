
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:food365/splash_screen.dart';
import 'package:food365/wrapper.dart';
import 'package:provider/provider.dart';

import 'domain/models/modules/ordering/cart_model.dart';
import 'domain/models/modules/ordering/menu_item_model.dart';
import 'domain/models/modules/ordering/order.dart';
import 'domain/services/menu_service.dart';
import 'domain/services/order_service.dart';
import 'generated_routes.dart';

FirebaseDatabase database = FirebaseDatabase.instance;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String id = 'my app';
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CartModel()),
        FutureProvider<List<MenuItemModel>>.value(value: MenuService().getMenuItems()),
        FutureProvider<List<OrderModel>>.value(value: OrderService().getAllOrders())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: RouteGenerator.generateRoute,
        home: FutureBuilder(
          future: Firebase.initializeApp(),
          builder: (context, snapshot) {
            return snapshot.hasData ? const Wrapper() :  SplashScreenPage();
          },
        ),
      ),
    );
  }
}

