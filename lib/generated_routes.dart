import 'package:flutter/material.dart';
import 'package:food365/domain/models/modules/ordering/category.dart';
import 'package:food365/domain/models/modules/ordering/order.dart';
import 'package:food365/main.dart';
import 'package:food365/presentation/modules/admin/admin_screen.dart';
import 'package:food365/presentation/modules/KitchenStaff/cook_screen.dart';
import 'package:food365/presentation/modules/admin/auth/auth.dart';
import 'package:food365/presentation/modules/ordering/cart/cart_screen.dart';
import 'package:food365/presentation/modules/ordering/checkout/views/checkout_screen.dart';
import 'package:food365/presentation/modules/ordering/checkout/views/timer.dart';
import 'package:food365/presentation/modules/ordering/menu/menu_screen.dart';
import 'package:food365/presentation/modules/staff/waiter/waiter_dashboard.dart';
import 'package:provider/provider.dart';

import 'domain/services/order_service.dart';
import 'presentation/dashboard/account_type.dart';
import 'presentation/modules/ordering/home/home_screen.dart';
import 'utils/shared/loading.dart';

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
      case CheckoutScreen.id:
        return MaterialPageRoute(builder: (_) => const CheckoutScreen());
      case WaiterDashboard.id:
        return MaterialPageRoute(builder: (_) => const WaiterDashboard());
      case CookScreen.id:
        return MaterialPageRoute(builder: (_) => const CookScreen());
      case AdminScreen.id:
        return MaterialPageRoute(builder: (_) => AdminScreen());
      case Authenticate.id:
        return MaterialPageRoute(builder: (_) => Authenticate());
      case MyHomePage.id:
        return MaterialPageRoute(
          builder: (_) => MyHomePage(order: settings.arguments as OrderModel,)
          // builder: (_) => FutureBuilder(
          //   future: OrderService().getOrder(orderID: settings.arguments),
          //   builder: (context, snapshot) {
          //     print(snapshot.data as OrderModel);
          //     return snapshot.hasData
          //         ? MyHomePage(
          //             order: snapshot.data as OrderModel,
          //           )
          //         : Loading();
          //   },
          // ),
        );

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
