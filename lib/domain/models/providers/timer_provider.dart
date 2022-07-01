import 'package:flutter/cupertino.dart';
import 'package:food365/domain/models/modules/ordering/menu_item_model.dart';
import 'package:food365/domain/models/modules/ordering/order_item.dart';
import 'package:food365/domain/services/menu_service.dart';

class TimerProvider extends ChangeNotifier {
  //final String orderID;
  //final List<Duration> itemTimes;

  Future<Duration> getTime({
    required order,
  }) async {
    List<OrderItem> allItems = order.allOrderItems;
    Duration totalTime = Duration();
    List<Future<Duration>> times = allItems.map((item) async {
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

  // factory TimerProvider.fromJson() {
  //   return TimerProvider(orderID: orderID, itemTimes: itemTimes);
  // }
}
