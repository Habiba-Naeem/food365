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
  List<OrderModel> currentOrders = [];
  List<OrderModel> servedOrders = [];

  List<OrderModel> get allcurrentOrders => currentOrders;
  List<OrderModel> get allservedOrders => servedOrders;

  // Stream<List<OrderModel>> get allOrders() {
  //   return getAllOrders();
  // }

  Future<List<OrderModel>> getAllOrders() async {
    var response =
        await httpClient.get(Uri.parse(baseURL + ordersURL + jsonVariable));

    Map<String, dynamic> data =
        jsonDecode(response.body) as Map<String, dynamic>;

    List<OrderModel> orders = data.entries.map((order) {
      // if (order.value['cookingStatus'] == false) {
      //   currentOrders
      //       .add(OrderModel.fromJson(json: order.value, key: order.key));
      //   print("inorders");
      //   print(currentOrders);
      // }
      // if (order.value["serviceStatus"] == true) {
      //   servedOrders
      //       .add(OrderModel.fromJson(json: order.value, key: order.key));
      // }
      return OrderModel.fromJson(json: order.value, key: order.key);
    }).toList();
    //print(currentOrders);
    return orders;
  }

  getServedOrders() async {
    List<OrderModel> orders = await getAllOrders();
    orders.map((order) {
      if (order.serviceStatus == true) {
        servedOrders.add(order);
      }
    });
  }

  getCurrentOrders() async {
    //List<OrderModel> currentOrders = [];
    // var response =
    //     await httpClient.get(Uri.parse(baseURL + ordersURL + jsonVariable + '?orderBy="cookingStatus"&equalTo=false'));

    // Map<String, dynamic> data =
    //     jsonDecode(response.body) as Map<String, dynamic>;

    List<OrderModel> orders = await getAllOrders();
    orders.map((order) {
      if (order.cookingStatus == false) {
        currentOrders.add(order);
      }
    });
    // print(currentOrders);
    // currentOrders.addAll(orders.map((e) {
    //   if (e.cookingStatus == false) {
    //     return e;
    //   }
    //   return null;
    // }));
    //orders.then((value) => null)
    // currentOrders.add(orders.map((e) {
    //   if (e.cookingStatus == false) {
    //     return OrderModel.fromJson(json: e.value, key: e.key);
    //   }
    //   return e;
    //   //return OrderModel.fromJson(json: e.value, key: e.key);
    // }));
    // print(currentOrders);
    // return currentOrders;
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
