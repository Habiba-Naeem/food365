import 'dart:convert';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:food365/domain/models/modules/ordering/api_response.dart';
import 'package:food365/domain/models/modules/ordering/order.dart';
import 'package:food365/domain/models/modules/ordering/order_item.dart';
import 'package:food365/domain/services/order_status_service.dart';
import 'package:food365/utils/constants.dart';
import 'package:http/http.dart' as http;
import '../models/modules/ordering/cart_item.dart';

var httpClient = http.Client();
const baseURL = "https://food365-264fb-default-rtdb.firebaseio.com/";
const ordersURL = "Orders";
const jsonVariable = '.json';
FirebaseDatabase database = FirebaseDatabase.instance;

class OrderService {
  Stream<List<OrderModel>> getOrderStream() {
    final stream = FirebaseDatabase.instance
        .ref(ordersURL)
        .orderByChild("createdAt")
        .onValue;
    final streamToPublish = stream.map((event) {
      List<OrderModel> ordersList = [];
      Map<String, dynamic>.from(event.snapshot.value as dynamic).forEach(
        (key, value) => ordersList.add(
          OrderModel.fromJson(json: value, key: key),
        ),
      );
      print(ordersList);
      return ordersList;
    });
    return streamToPublish.asBroadcastStream();
  }

  Future<List<OrderModel>> getAllOrders() async {
    try {
      DatabaseReference ref = FirebaseDatabase.instance.ref(ordersURL);
      final snapshot = await ref.onValue.listen((event) {
        final data = event.snapshot.value;
      });
      print(snapshot);

      var response = await httpClient.get(
        Uri.parse(baseURL + ordersURL + jsonVariable),
      );

      Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;
      print(data);
      List<OrderModel> orders = data.entries.map((order) {
        return OrderModel.fromJson(json: order.value, key: order.key);
      }).toList();
      var parsedResponse = ApiResponse.fromJson(response.statusCode);

      if (response.statusCode == 200) {
        //TimerProvider(itemTimes: );

        return orders;
      }
      throw parsedResponse.returnException();
    } on SocketException catch (e) {
      return [];
    }
  }

  Future<OrderModel> getOrder({
    orderID,
  }) async {
    print(orderID);
    try {
      var response = await httpClient
          .get(Uri.parse(baseURL + ordersURL + '/' + orderID + jsonVariable));
      Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;
      print(data);
      OrderModel order = OrderModel.fromJson(json: data, key: orderID);

      var parsedResponse = ApiResponse.fromJson(response.statusCode);

      if (response.statusCode == 200) {
        // return MenuItemModel.fromJson(
        //     json: data.values.first, key: data.keys.first);
        return order;
      }
      throw parsedResponse.returnException();
    } catch (e) {}
  }

  Stream<List<OrderModel>> getCookingOrdersStream() {
    final stream = FirebaseDatabase.instance
        .ref(ordersURL)
        .orderByChild("cookingStatus")
        .equalTo(false)
        .onValue;

    final streamToPublish = stream.map((event) {
      List<OrderModel> ordersList = [];
      Map<String, dynamic>.from(event.snapshot.value as dynamic).forEach(
        (
          key,
          value,
        ) {
          var order = ordersList.add(
            OrderModel.fromJson(json: value, key: key),
          );
        },
      );
      ordersList.forEach((order) {
        OrderStatusService().updateCookingStatus(order: order);
      });
      print(ordersList);
      return ordersList;
    });
    return streamToPublish.asBroadcastStream();
  }

  Stream<List<OrderModel>> getReadyOrdersStream() {
    final stream = FirebaseDatabase.instance
        .ref(ordersURL)
        .orderByChild("readyStatus")
        .equalTo(false)
        .onValue;
    final streamToPublish = stream.map((event) {
      List<OrderModel> ordersList = [];
      Map<String, dynamic>.from(event.snapshot.value as dynamic).forEach(
        (key, value) => ordersList.add(
          OrderModel.fromJson(json: value, key: key),
        ),
      );
      ordersList.forEach((order) {
        OrderStatusService().updateReadyStatus(order: order);
      });
      print(ordersList);
      return ordersList;
    });
    return streamToPublish.asBroadcastStream();
  }

  Stream<List<OrderModel>> getServedOrdersStream() {
    final stream = FirebaseDatabase.instance
        .ref(ordersURL)
        .orderByChild("serviceStatus")
        .onValue;
    final streamToPublish = stream.map((event) {
      List<OrderModel> ordersList = [];
      Map<String, dynamic>.from(event.snapshot.value as dynamic).forEach(
        (key, value) => ordersList.add(
          OrderModel.fromJson(json: value, key: key),
        ),
      );
      ordersList.forEach((order) {
        OrderStatusService().updateServiceStatus(order: order);
      });
      print(ordersList);
      return ordersList;
    });
    return streamToPublish.asBroadcastStream();
  }

  postOrder({
    totalPrice,
    List<CartItem> items,
  }) async {
    try {
      List<OrderItem> orderItems = items.map((item) {
        return OrderItem.postOrderItem(
          menuItemID: item.menuItemID,
          menuName: item.menuName,
          //menuItemTime: item.time,
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
      Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;
      print(data.values.first);
      var parsedResponse = ApiResponse.fromJson(response.statusCode);

      if (response.statusCode == 200) {
        order.orderID = data.values.first;
        return {
          "order": order,
          "orderID": data.values.first,
          "success": success,
        };
      }
      throw parsedResponse.returnException();
    } on SocketException catch (e) {
      return noInternet;
    }
  }

  // Future<List<OrderModel>> getServedOrders() async {
  //   List<OrderModel> servedOrders = [];
  //   List<OrderModel> orders = await getAllOrders();
  //   orders.forEach(
  //     (order) {
  //       bool orderbool =
  //           order.allOrderItems.any((element) => element.serviceStatus == true);
  //       if (orderbool) {
  //         servedOrders.add(order);
  //       }
  //     },
  //   );
  //   return servedOrders;
  // }

  // Future<List<OrderModel>> getCurrentOrders() async {
  //   List<OrderModel> currentOrders = [];
  //   try {
  //     List<OrderModel> orders = await getAllOrders();
  //     orders.forEach(
  //       (order) {
  //         bool orderbool = order.allOrderItems
  //             .any((element) => element.cookingStatus == false);
  //         if (orderbool) {
  //           currentOrders.add(order);
  //         }
  //       },
  //     );
  //     return currentOrders;
  //   } on SocketException catch (e) {
  //     return currentOrders;
  //   }
  // }

  // Future<List<OrderModel>> getReadyOrders() async {
  //   List<OrderModel> readyOrders = [];
  //   try {
  //     List<OrderModel> orders = await getAllOrders();
  //     orders.forEach(
  //       (order) {
  //         bool orderbool =
  //             order.allOrderItems.any((element) => element.readyStatus == true);
  //         if (orderbool) {
  //           readyOrders.add(order);
  //         }
  //       },
  //     );
  //     return readyOrders;
  //   } on SocketException catch (e) {
  //     return readyOrders;
  //   }
  // }

}
