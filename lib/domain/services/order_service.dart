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
  Future<List<OrderModel>> getAllOrders() async {
    var response =
        await httpClient.get(Uri.parse(baseURL + ordersURL + jsonVariable));

    Map<String, dynamic> data =
        jsonDecode(response.body) as Map<String, dynamic>;

    List<OrderModel> orders = data.entries.map((order) {
      return OrderModel.fromJson(json: order.value, key: order.key);
    }).toList();
    return orders;
  }

  Future<List<OrderModel>> getServedOrders() async {
    List<OrderModel> servedOrders = [];
    List<OrderModel> orders = await getAllOrders();

    orders.forEach((order) {
      if (order.serviceStatus == true) {
        servedOrders.add(order);
      }
    });

    return servedOrders;
  }

  Future<List<OrderModel>> getCurrentOrders() async {
    List<OrderModel> currentOrders = [];
    List<OrderModel> orders = await getAllOrders();

    orders.forEach((order) {
      if (order.cookingStatus == false) {
        currentOrders.add(order);
      }
    });

    return currentOrders;
  }

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
