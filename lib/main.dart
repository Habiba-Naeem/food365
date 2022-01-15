import 'package:flutter/material.dart';
import 'package:food365/presentation/modules/order/menu.dart';

import 'generated_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String id = 'my app';
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: RouteGenerator.generateRoute,
      home: Menu(),
    );
  }
}
