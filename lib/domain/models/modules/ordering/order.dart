import 'package:food365/domain/models/modules/ordering/cart_model.dart';

class OrderModel {
  bool serviceStatus = false;
  bool cookingStatus = false;
  String orderID;
  DateTime createdAt;
  DateTime updatedAt;
  double totalPrice;
  CartModel cart;

  OrderModel({
    // required this.serviceStatus,
    // required this.cookingStatus,
    required this.orderID,
    required this.createdAt,
    required this.updatedAt,
    required this.totalPrice,
    required this.cart,
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
        cart: json['cart']);
  }

  Map<String, dynamic> toJson() => {
        "orderID": orderID,
        "serviceStatus": serviceStatus,
        "cookingStatus": cookingStatus,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "totalPrice": totalPrice,
        "cart": cart
      };
}
