import 'dart:convert';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:food365/domain/models/modules/ordering/api_response.dart';
import 'package:food365/domain/models/modules/ordering/category.dart' as mycat;
import 'package:food365/domain/models/modules/ordering/menu_item_model.dart';
import 'package:food365/domain/models/modules/ordering/order.dart';
import 'package:food365/domain/models/modules/ordering/order_item.dart';
import 'package:food365/domain/models/providers/timer_provider.dart';
import 'package:food365/domain/services/menu_service.dart';
import 'package:food365/presentation/modules/ordering/menu/menu_screen.dart';
import 'package:food365/utils/constants.dart';
import 'package:food365/utils/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import '../models/modules/ordering/cart_item.dart';

var httpClient = http.Client();
const baseURL = "https://food365-89950-default-rtdb.firebaseio.com/";
const ordersURL = "Orders";
const jsonVariable = '.json';
FirebaseDatabase database = FirebaseDatabase.instance;


class OrderService {
  getbyRef() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child(ordersURL).get();
    if (snapshot.exists) {
      print(snapshot.value);
    } else {
      print('No data available.');
    }
    // starCountRef.onValue.listen((DatabaseEvent event) {
    //   final data = event.snapshot.value;
    //   print(data);
    // });
    // print(starCountRef);
    // return starCountRef;
  }

  Future<List<OrderModel>> getAllOrders() async {
    try {
      //var res = EventSource(baseURL + ordersURL + jsonVariable);
      //print(res);
      // DatabaseReference ref = FirebaseDatabase.instance.ref(ordersURL);
      // DatabaseEvent event = await ref.once();
      // print(ref);
      var response = await httpClient.get(
        Uri.parse(baseURL + ordersURL + jsonVariable),
      );
      print(response.headers);
      Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;
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

  getOrder({
    required orderID,
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
    } on SocketException catch (e) {
      return;
    }
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
    try {
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
    } on SocketException catch (e) {
      return currentOrders;
    }
  }

  Future<List<OrderModel>> getReadyOrders() async {
    List<OrderModel> readyOrders = [];
    try {
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
    } on SocketException catch (e) {
      return readyOrders;
    }
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
      Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;
      print(data.values.first);
      var parsedResponse = ApiResponse.fromJson(response.statusCode);

      if (response.statusCode == 200) {
        return {
          "order": data,
          "orderID": data.values.first,
          "success": success,
        };
      }
      throw parsedResponse.returnException();
    } on SocketException catch (e) {
      return noInternet;
    }
  }

  updateCookingStatus({
    required OrderModel order,
  }) async {
    try {
      order.cookingStatus = true;
      var response = await httpClient.patch(
          Uri.parse(baseURL +
              ordersURL +
              "/" +
              order.orderID.toString() +
              jsonVariable),
          body: jsonEncode(order.toJson()));
      var parsedResponse = ApiResponse.fromJson(response.statusCode);

      if (response.statusCode == 200) {
        return success;
      }
      throw parsedResponse.returnException();
    } on SocketException catch (e) {
      return noInternet;
    }
  }

  updateReadyStatus({
    required OrderModel order,
  }) async {
    try {
      order.readyStatus = true;
      var response = await httpClient.patch(
          Uri.parse(baseURL +
              ordersURL +
              "/" +
              order.orderID.toString() +
              jsonVariable),
          body: jsonEncode(order.toJson()));
      var parsedResponse = ApiResponse.fromJson(response.statusCode);

      if (response.statusCode == 200) {
        return success;
      }
      throw parsedResponse.returnException();
    } on SocketException catch (e) {
      return noInternet;
    }
  }

  updateOrderItemCookingStatus({
    required int id,
    required OrderItem orderItem,
    required String orderID,
  }) async {
    try {
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
      var parsedResponse = ApiResponse.fromJson(response.statusCode);

      if (response.statusCode == 200) {
        return success;
      }
      throw parsedResponse.returnException();
    } on SocketException catch (e) {
      return noInternet;
    }
  }

  updateOrderItemReadyStatus({
    required int id,
    required OrderItem orderItem,
    required String orderID,
  }) async {
    try {
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
      var parsedResponse = ApiResponse.fromJson(response.statusCode);

      if (response.statusCode == 200) {
        return success;
      }
      throw parsedResponse.returnException();
    } on SocketException catch (e) {
      return noInternet;
    }
  }

  updateOrderItemServiceStatus({
    required int id,
    required OrderItem orderItem,
    required String orderID,
  }) async {
    try {
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
      var parsedResponse = ApiResponse.fromJson(response.statusCode);

      if (response.statusCode == 200) {
        return success;
      }
      throw parsedResponse.returnException();
    } on SocketException catch (e) {
      return noInternet;
    }
  }
}
