import 'package:food365/domain/models/modules/ordering/cart_item.dart';
import 'package:food365/domain/models/modules/ordering/cart_model.dart';

class OrderModel {
  bool serviceStatus = false;
  bool cookingStatus = false;
  String? orderID;
  DateTime createdAt;
  DateTime updatedAt;
  double totalPrice;
  // CartModel cart;
  List<CartItem> items = [];

  OrderModel({
    // required this.serviceStatus,
    // required this.cookingStatus,
    required this.orderID,
    required this.createdAt,
    required this.updatedAt,
    required this.totalPrice,
    //  required this.cart,
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
    return OrderModel(
        orderID: key,
        // serviceStatus: json['serviceStatus'],
        // cookingStatus: json['cookingStatus'],

        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        totalPrice: json['totalPrice'],
        items: json['items']);
  }

  Map<String, dynamic> toJson() => {
        "serviceStatus": serviceStatus,
        "cookingStatus": cookingStatus,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "totalPrice": totalPrice,
        "items": items
      };
}
