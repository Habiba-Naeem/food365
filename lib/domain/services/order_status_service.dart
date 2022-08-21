import 'dart:convert';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:food365/domain/models/modules/ordering/api_response.dart';
import 'package:food365/domain/models/modules/ordering/order.dart';
import 'package:food365/domain/models/modules/ordering/order_item.dart';
import 'package:food365/utils/constants.dart';
import 'package:http/http.dart' as http;
import '../models/modules/ordering/cart_item.dart';

var httpClient = http.Client();
const baseURL = "https://food365-ffc14-default-rtdb.firebaseio.com/";
const ordersURL = "Orders";
const jsonVariable = '.json';
FirebaseDatabase database = FirebaseDatabase.instance;

class OrderStatusService {
  updateCookingStatus({
     OrderModel order,
  }) async {
    try {
      print(order.pendingItems);
      if (order.pendingItems == 0) {
        order.cookingStatus = true;
      }
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
     OrderModel order,
  }) async {
    try {
      if (order.readyItems == order.allOrderItems.length) {
        order.readyStatus = true;
      }
     // order.readyStatus = true;
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

  updateServiceStatus({
     OrderModel order,
  }) async {
    try {
      if (order.servedItems == order.allOrderItems.length) {
        order.serviceStatus= true;
      }
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
     int id,
     OrderItem orderItem,
     String orderID,
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
     int id,
     OrderItem orderItem,
     String orderID,
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
     int id,
     OrderItem orderItem,
     String orderID,
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
