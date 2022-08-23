import 'dart:convert';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:food365/domain/models/modules/inventory/inventory_item_model.dart';
import 'package:food365/utils/constants.dart';
import 'package:http/http.dart' as http;

import '../models/modules/ordering/api_response.dart';

var httpClient = http.Client();
const baseURL = "https://food365-ffc14-default-rtdb.firebaseio.com/";
const categoriesURL = "/Categories";
const inventoryURL = "/Inventory";
const jsonVariable = '.json';
FirebaseDatabase database = FirebaseDatabase.instance;

class InventoryService {
  Stream<List<InventoryItemModel>> getInventoryItems() {
    Stream<DatabaseEvent> stream =
        FirebaseDatabase.instance.ref(inventoryURL).orderByChild("expiryDate").onValue;
    final streamToPublish = stream.map((event) {
      List<InventoryItemModel> itemList = [];
      Map<String, dynamic>.from(event.snapshot.value as dynamic).forEach(
        (key, value) async {
          itemList.add(
            InventoryItemModel.fromJson(json: value, key: key),
          );
        },
      );
      itemList.forEach((item) {
        //print(item.daysTillExpiry);
        updateExpiryStatus(inventoryItem: item);
      });
      print(itemList);
      return itemList;
    });
    return streamToPublish.asBroadcastStream();
  }

  updateExpiryStatus({
    InventoryItemModel inventoryItem,
  }) async {
    try {
      print(inventoryItem.expired);
      if (inventoryItem.daysTillExpiry <= 0) {
        inventoryItem.expired = true;
      }
      var response = await httpClient.patch(
          Uri.parse(baseURL +
              inventoryURL +
              "/" +
              inventoryItem.itemID.toString() +
              jsonVariable),
          body: jsonEncode(inventoryItem.toJson()));
      var parsedResponse = ApiResponse.fromJson(response.statusCode);

      if (response.statusCode == 200) {
        return success;
      }
      throw parsedResponse.returnException();
    } on SocketException catch (e) {
      return noInternet;
    }
  }

  deleteInventoryItem({
    String inventoryItemID,
  }) async {
    try {
      var response = await httpClient.delete(
        Uri.parse(baseURL +
            inventoryURL +
            '/' +
            inventoryItemID.toString() +
            jsonVariable),
      );
      var parsedResponse = ApiResponse.fromJson(response.statusCode);

      if (response.statusCode == 200) {
        return success;
      }
      throw parsedResponse.returnException();
    } on SocketException catch (e) {
      return noInternet;
    }
  }

  postInventoryItem({
    String itemName,
    int quantity,
    DateTime boughtDate,
    DateTime expiryDate,
  }) async {
    try {
      InventoryItemModel item = InventoryItemModel.postMenu(
        itemName: itemName,
        boughtDate: boughtDate,
        expiryDate: expiryDate,
        quantity: quantity,
      );

      var response = await httpClient.post(
          Uri.parse(baseURL + inventoryURL + jsonVariable),
          body: jsonEncode(item.toJson()));

      var parsedResponse = ApiResponse.fromJson(response.statusCode);

      Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode == 200) {
        return success;
      }
      throw parsedResponse.returnException();
    } on SocketException catch (e) {
      return noInternet;
    }
  }
}
