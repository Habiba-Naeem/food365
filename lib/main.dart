import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food365/domain/services/menu_service.dart';
import 'package:food365/presentation/modules/home/home_screen.dart';
import 'package:food365/presentation/modules/onboarding_screen.dart';
import 'package:food365/presentation/shared/loading.dart';
import 'package:food365/presentation/modules/ordering/menu/menu_screen.dart';
import 'package:food365/presentation/modules/staff/waiter/waiter_dashboard.dart';
import 'package:firebase_database/firebase_database.dart';

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
    //MenuService().postCategories();
    MenuService().getCategories();
    MenuService().getMenuItems();
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: RouteGenerator.generateRoute,
      home: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          return snapshot.hasData ? OnboardingScreen() : Loading();
        },
      ),
    );
  }
}
