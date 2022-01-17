
import 'package:flutter/material.dart';
import 'package:food365/main.dart';
import 'package:food365/presentation/modules/cart/cart_items.dart';
import 'package:food365/presentation/modules/dashboard/account_type.dart';
import 'package:food365/presentation/modules/order/menu.dart';
import 'package:food365/presentation/modules/staff/waiter/waiter_dashboard.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MyApp.id:
        return MaterialPageRoute(builder: (_) => const MyApp());
  
      case AccountType.id:
        return MaterialPageRoute(builder: (_) => const AccountType());
      case Menu.id:
        return MaterialPageRoute(builder: (_) =>  const Menu());
      case CartItem.id:
        return MaterialPageRoute(builder: (_) =>  const CartItem());
        case WaiterDashboard.id:
        return MaterialPageRoute(builder: (_) =>  const WaiterDashboard());
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