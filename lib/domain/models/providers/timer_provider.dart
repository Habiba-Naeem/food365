import 'package:flutter/cupertino.dart';
import 'package:food365/domain/models/modules/ordering/menu_item_model.dart';
import 'package:food365/domain/models/modules/ordering/order.dart';
import 'package:food365/domain/models/modules/ordering/order_item.dart';
import 'package:food365/domain/services/menu_service.dart';

class TimerProvider extends ChangeNotifier {
  //final String orderID;
  //final List<Duration> itemTimes;

  List<Duration> getTimes({
    required List<OrderItem> allItems,
  }) {
    List<Duration> times = [];
    var sum = Duration();
    allItems.map((item) async {
      MenuItemModel menuItem =
          await MenuService().getMenuItem(menuItemID: item.menuItemID);
      times.add(menuItem.time);
      print(times);
      sum = sum + menuItem.time;
    });
    return times;
  }

  getTime({
    required OrderModel order,
  }) async {
    List<Duration> times = [];
    Duration sum = Duration();
    return order.allOrderItems.map((item) async {
      MenuItemModel menuItem =
          await MenuService().getMenuItem(menuItemID: item.menuItemID);
      times.add(menuItem.time);
      print(times);
      sum = (sum + menuItem.time);
      print(sum);
      return sum.inMinutes;
    });
  }
}
