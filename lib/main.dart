import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food365/domain/models/modules/ordering/cart_model.dart';
import 'package:food365/domain/models/modules/ordering/menu_item_model.dart';
import 'package:food365/domain/services/menu_service.dart';
import 'package:food365/presentation/modules/home/home_screen.dart';
import 'package:food365/presentation/modules/onboarding_screen.dart';
import 'package:food365/presentation/modules/ordering/checkout/checkout_screen.dart';
import 'package:food365/presentation/shared/loading.dart';
import 'package:food365/presentation/modules/ordering/menu/menu_screen.dart';
import 'package:food365/presentation/modules/staff/waiter/waiter_dashboard.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:food365/wrapper.dart';
import 'package:provider/provider.dart';

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
    MenuService().getCategories();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CartModel()),
        FutureProvider<List<MenuItemModel>>.value(value: MenuService().getMenuItems())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: RouteGenerator.generateRoute,
        home: FutureBuilder(
          future: Firebase.initializeApp(),
          builder: (context, snapshot) {
            return snapshot.hasData ? const Wrapper() : const Loading();
          },
        ),
      ),
    );
  }
}

