import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:food365/presentation/modules/ordering/checkout/controller/checkout_controller.dart';
import 'package:food365/presentation/modules/ordering/checkout/views/timer.dart';
import 'package:food365/splash_screen.dart';
import 'package:food365/wrapper.dart';
import 'package:provider/provider.dart';

import 'domain/models/modules/ordering/cart_model.dart';
import 'domain/models/modules/ordering/menu_item_model.dart';
import 'domain/models/modules/ordering/order.dart';
import 'domain/services/menu_service.dart';
import 'domain/services/order_service.dart';
import 'firebase_options.dart';
import 'generated_routes.dart';

FirebaseDatabase database = FirebaseDatabase.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "food365",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
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
        // ChangeNotifierProvider.value(value: CheckoutController),
        FutureProvider<List<MenuItemModel>>.value(
            value: MenuService().getMenuItems()),
        // FutureProvider<List<OrderModel>>.value(value: OrderService().getAllOrders())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: RouteGenerator.generateRoute,
        //home: MyHomePage(),
        home: FutureBuilder(
          // future: Firebase.initializeApp(
          //   options: DefaultFirebaseOptions.currentPlatform,
          // ),
          builder: (context, snapshot) {
            return snapshot.hasData ? const Wrapper() : SplashScreenPage();
          },
        ),
      ),
    );
  }
}
