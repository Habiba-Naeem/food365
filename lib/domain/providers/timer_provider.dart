import 'package:flutter/cupertino.dart';
import 'package:food365/domain/models/modules/ordering/menu_item_model.dart';
import 'package:food365/domain/models/modules/ordering/order.dart';
import 'package:food365/domain/models/modules/ordering/order_item.dart';
import 'package:food365/domain/services/menu_service.dart';

class TimerProvider extends ChangeNotifier {
  OrderModel order;
  var totalDuration = Duration();
  Duration totalTime;
  TimerProvider();

  getTotalTime() {
    
    order.allOrderItems.forEach(
      (item) async {
        await MenuService().getMenuItem(menuItemID: item.menuItemID).then(
          (value) {
            print(value.time);
            totalDuration = (totalDuration + value.time);
          },
        );
        if (item == order.allOrderItems.last) {
          totalTime = (totalDuration ~/ order.allOrderItems.length);
          notifyListeners();
        }
      },
    );
  }
}
