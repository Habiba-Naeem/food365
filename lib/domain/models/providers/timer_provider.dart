import 'package:flutter/cupertino.dart';
import 'package:food365/domain/models/modules/ordering/menu_item_model.dart';
import 'package:food365/domain/models/modules/ordering/order_item.dart';
import 'package:food365/domain/services/menu_service.dart';

class TimerProvider extends ChangeNotifier {
  //final String orderID;
  //final List<Duration> itemTimes;

  Duration getTime({
    required order,
  })  {
    List<OrderItem> allItems = order.allOrderItems;
    Duration totalTime = Duration();
    List<Duration> times = allItems.map((item) {
      MenuItemModel menuItem =
          MenuService().getMenuItem(menuItemID: item.menuItemID);
      print(menuItem.time);
      //totalTime =  totalTime + menuItem.time;
      return menuItem.time;
    }).toList();

    //totalTime = await times.fold(times.first, (previousValue, element) => previousValue);
    print(totalTime);
    return totalTime;
  }

  getTimes(List<OrderItem> allItems) {
List<Duration> times = allItems.map((item) {
      MenuItemModel menuItem =
          MenuService().getMenuItem(menuItemID: item.menuItemID);
      print(menuItem.time);
      //totalTime =  totalTime + menuItem.time;
      return menuItem.time;
    }).toList();

  }

  // factory TimerProvider.fromJson() {
  //   return TimerProvider(orderID: orderID, itemTimes: itemTimes);
  // }
}
