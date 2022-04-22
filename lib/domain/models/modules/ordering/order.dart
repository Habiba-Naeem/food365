import 'package:flutter/material.dart';
import 'package:food365/domain/models/modules/ordering/cart_item.dart';
import 'package:food365/domain/models/modules/ordering/cart_model.dart';
import 'package:food365/domain/models/modules/ordering/order_item.dart';
import 'package:food365/presentation/modules/ordering/cart/cart_item.dart';

class OrderModel extends ChangeNotifier {
  bool serviceStatus = false;
  bool readyStatus = false;
  bool cookingStatus = false;
  String? orderID;
  DateTime createdAt;
  DateTime updatedAt;
  double totalPrice;
  List<OrderItem> items = [];

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

  List<OrderItem> get allOrderItems => items;

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
    print(json);
    List<OrderItem> orderItems = json['items']
        .map<OrderItem>((item) => OrderItem(
              //orderItemID: index,
              cookingStatus: item['cookingStatus'],
              readyStatus: item['readyStatus'],
              serviceStatus: item['serviceStatus'],
              menuItemID: item['menuItemID'],
              menuName: item['menuName'],
              quantity: item['quantity'],
            ))
        .toList();
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
}
