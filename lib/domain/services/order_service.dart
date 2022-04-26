import 'dart:convert';
import 'dart:io';
import 'package:food365/domain/models/modules/ordering/api_response.dart';
import 'package:food365/domain/models/modules/ordering/category.dart' as mycat;
import 'package:food365/domain/models/modules/ordering/menu_item_model.dart';
import 'package:food365/domain/models/modules/ordering/order.dart';
import 'package:food365/domain/models/modules/ordering/order_item.dart';
import 'package:food365/utils/constants.dart';
import 'package:food365/utils/exceptions.dart';
import 'package:http/http.dart' as http;

import '../models/modules/ordering/cart_item.dart';

var httpClient = http.Client();
const baseURL = "https://food365-89950-default-rtdb.firebaseio.com/";
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
    orders.forEach(
      (order) {
        bool orderbool =
            order.allOrderItems.any((element) => element.serviceStatus == true);
        if (orderbool) {
          servedOrders.add(order);
        }
      },
    );
    return servedOrders;
  }

  Future<List<OrderModel>> getCurrentOrders() async {
    List<OrderModel> currentOrders = [];
    List<OrderModel> orders = await getAllOrders();
    orders.forEach(
      (order) {
        bool orderbool = order.allOrderItems
            .any((element) => element.cookingStatus == false);
        if (orderbool) {
          currentOrders.add(order);
        }
      },
    );
    return currentOrders;
  }

  Future<List<OrderModel>> getReadyOrders() async {
    List<OrderModel> readyOrders = [];
    List<OrderModel> orders = await getAllOrders();
    orders.forEach(
      (order) {
        bool orderbool =
            order.allOrderItems.any((element) => element.readyStatus == true);
        if (orderbool) {
          readyOrders.add(order);
        }
      },
    );
    return readyOrders;
  }

  postOrder({
    required totalPrice,
    required List<CartItem> items,
  }) async {
    try {
      List<OrderItem> orderItems = items.map((item) {
        return OrderItem.postOrderItem(
          menuItemID: item.menuItemID,
          menuName: item.menuName,
          quantity: item.quantity,
        );
      }).toList();
      OrderModel order = OrderModel.postOrder(
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        totalPrice: totalPrice,
        items: orderItems,
      );

      var response = await httpClient.post(
          Uri.parse(baseURL + ordersURL + jsonVariable),
          body: jsonEncode(order.toJson()));
      print(response.statusCode);
      var parsedResponse = ApiResponse.fromJson(response.statusCode);

      if (response.statusCode == 200) {
        return success;
      }
      throw parsedResponse.returnException();
    } on SocketException catch (e) {
      return noInternet;
    }
  }

  updateCookingStatus({
    required OrderModel order,
  }) async {
    order.cookingStatus = true;
    var response = await httpClient.patch(
        Uri.parse(baseURL +
            ordersURL +
            "/" +
            order.orderID.toString() +
            jsonVariable),
        body: jsonEncode(order.toJson()));
  }

  updateReadyStatus({
    required OrderModel order,
  }) async {
    order.readyStatus = true;
    var response = await httpClient.patch(
        Uri.parse(baseURL +
            ordersURL +
            "/" +
            order.orderID.toString() +
            jsonVariable),
        body: jsonEncode(order.toJson()));
  }

  updateOrderItemCookingStatus({
    required int id,
    required OrderItem orderItem,
    required String orderID,
  }) async {
    orderItem.cookingStatus = true;

    var response = await httpClient.patch(
        Uri.parse(baseURL +
            ordersURL +
            "/" +
            orderID.toString() +
            "/" +
            "items" +
            "/" +
            id.toString() +
            jsonVariable),
        body: jsonEncode(orderItem.toJson()));
  }

  updateOrderItemReadyStatus({
    required int id,
    required OrderItem orderItem,
    required String orderID,
  }) async {
    orderItem.readyStatus = true;

    var response = await httpClient.patch(
        Uri.parse(baseURL +
            ordersURL +
            "/" +
            orderID.toString() +
            "/" +
            "items" +
            "/" +
            id.toString() +
            jsonVariable),
        body: jsonEncode(orderItem.toJson()));
  }

  updateOrderItemServiceStatus({
    required int id,
    required OrderItem orderItem,
    required String orderID,
  }) async {
    orderItem.serviceStatus = true;

    var response = await httpClient.patch(
        Uri.parse(baseURL +
            ordersURL +
            "/" +
            orderID.toString() +
            "/" +
            "items" +
            "/" +
            id.toString() +
            jsonVariable),
        body: jsonEncode(orderItem.toJson()));
  }
}
