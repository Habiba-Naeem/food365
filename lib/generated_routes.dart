import 'package:flutter/material.dart';
import 'package:food365/domain/models/modules/ordering/category.dart';
import 'package:food365/main.dart';
import 'package:food365/presentation/modules/dashboard/account_type.dart';
import 'package:food365/presentation/modules/home/home_screen.dart';
import 'package:food365/presentation/modules/ordering/cart/cart_item.dart';
import 'package:food365/presentation/modules/ordering/cart/cart_screen.dart';
import 'package:food365/presentation/modules/ordering/menu/menu_screen.dart';
import 'package:food365/presentation/modules/staff/waiter/waiter_dashboard.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MyApp.id:
        return MaterialPageRoute(builder: (_) => const MyApp());
      case AccountType.id:
        return MaterialPageRoute(builder: (_) => const AccountType());
      case HomeScreen.id:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case MenuScreen.id:
        return MaterialPageRoute(builder: (_) => const MenuScreen());

      case CartScreen.id:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case WaiterDashboard.id:
        return MaterialPageRoute(builder: (_) => const WaiterDashboard());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Could not find the route.')),
      );
    });
  }
}