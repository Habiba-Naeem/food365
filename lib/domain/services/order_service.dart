import 'dart:convert';
import 'package:food365/domain/models/modules/ordering/category.dart' as mycat;
import 'package:food365/domain/models/modules/ordering/menu_item_model.dart';
import 'package:food365/domain/models/modules/ordering/order.dart';
import 'package:http/http.dart' as http;

var httpClient = http.Client();
const baseURL = "https://food365-afac9-default-rtdb.firebaseio.com/";
const ordersURL = "/Orders";
const jsonVariable = '.json';

class OrderService {

  postOrder({
    required totalPrice,
    required items,
  }) async {
    OrderModel order = OrderModel.postOrder(
     createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      totalPrice: totalPrice,
      items: items
      //cart: cart,
    );

    var response = await httpClient.post(
        Uri.parse(baseURL + ordersURL + jsonVariable),
        body: jsonEncode(order.toJson()));
  }
}
