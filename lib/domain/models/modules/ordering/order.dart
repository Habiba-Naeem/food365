import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:food365/domain/models/modules/ordering/cart_item.dart';
import 'package:food365/domain/models/modules/ordering/cart_model.dart';
import 'package:food365/domain/models/modules/ordering/menu_item_model.dart';
import 'package:food365/domain/models/modules/ordering/order_item.dart';
import 'package:food365/domain/services/menu_service.dart';
import 'package:food365/presentation/modules/ordering/cart/cart_item.dart';
import 'package:food365/presentation/modules/ordering/menu/menu_item.dart';
import 'package:intl/intl.dart';

class OrderModel extends ChangeNotifier {
  bool serviceStatus = false;
  bool readyStatus = false;
  bool cookingStatus = false;
  String? orderID;
  DateTime createdAt;
  DateTime updatedAt;
  double totalPrice;
  List<OrderItem> items = [];
  Duration timeLeft = Duration();

  OrderModel({
    required this.serviceStatus,
    required this.cookingStatus,
    required this.readyStatus,
    required this.orderID,
    required this.createdAt,
    required this.updatedAt,
    required this.totalPrice,
    required this.items,
  });

  OrderModel.postOrder({
    required this.createdAt,
    required this.updatedAt,
    required this.totalPrice,
    required this.items,
  });

  factory OrderModel.fromJson({
    required json,
    required key,
  }) {
    List<OrderItem> orderItems = json['items'] != null
        ? List<OrderItem>.from(
            json['items'].map((x) => OrderItem.fromJson(json: x)).toList())
        : [];

    return OrderModel(
        orderID: key,
        serviceStatus: json['serviceStatus'],
        cookingStatus: json['cookingStatus'],
        readyStatus: json['readyStatus'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
        totalPrice: json['totalPrice'],
        items: orderItems);
  }

  Map<String, dynamic> toJson() => {
        "serviceStatus": serviceStatus,
        "cookingStatus": cookingStatus,
        "readyStatus": readyStatus,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "totalPrice": totalPrice,
        "items": items
      };

  List<OrderItem> get allOrderItems => items;

  int get pendingItems {
    final allItems = allOrderItems;

    var len =
        allItems.where((element) => element.cookingStatus == false).length;

    if (len == 0) {
      cookingStatus = true;
    }
    notifyListeners();
    return len;
  }

  int get readyItems {
    final allItems = allOrderItems;
    var len = allItems.where((element) => element.readyStatus == true).length;

    // if (len == 0) {
    //   readyStatus = true;
    // }
    notifyListeners();
    return len;
    // notifyListeners();
    // return allItems.where((element) => element.cookingStatus == true).length;
  }

  int get servedItems {
    final allItems = allOrderItems;
    var len = allItems.where((element) => element.serviceStatus == true).length;

    notifyListeners();
    return len;
    // notifyListeners();
    // return allItems.where((element) => element.cookingStatus == true).length;
  }

  get createdAgo {
    DateFormat dateFormat = DateFormat("HH:mm:ss yyyy-MM-dd");
    return dateFormat.format(createdAt);
    //return prettyDuration(DateTime.now().difference(createdAt));
  }

  Duration get allTimeLeft => timeLeft;

  Future serviceTimeLeft() async {
    print(timeLeft);
    final allItems = allOrderItems;

    var menuItemTime = await allItems.map((item) async {
      var menuItem =
          await MenuService().getMenuItem(menuItemID: item.menuItemID);
      print(menuItem.time);
      timeLeft = menuItem.time + timeLeft;
    });
    print(timeLeft);
    notifyListeners();
    return timeLeft;
  }
}
