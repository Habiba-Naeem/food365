import 'dart:convert';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:food365/domain/models/modules/inventory/inventory_item_model.dart';
import 'package:food365/utils/constants.dart';
import 'package:http/http.dart' as http;

import '../models/modules/ordering/api_response.dart';

var httpClient = http.Client();
const baseURL = "https://food365-264fb-default-rtdb.firebaseio.com/";
const categoriesURL = "/Categories";
const inventoryURL = "/Inventory";
const jsonVariable = '.json';
FirebaseDatabase database = FirebaseDatabase.instance;

class InventoryService {
  Stream<List<InventoryItemModel>> getMenuItems() {
    Stream<DatabaseEvent> stream =
        FirebaseDatabase.instance.ref(inventoryURL).onValue;
    final streamToPublish = stream.map((event) {
      List<InventoryItemModel> itemList = [];
      Map<String, dynamic>.from(event.snapshot.value as dynamic).forEach(
        (key, value) async {
          itemList.add(
            InventoryItemModel.fromJson(json: value),
          );
        },
      );
      print(itemList);
      return itemList;
    });
    return streamToPublish.asBroadcastStream();
  }

  postInventoryItem({
    required String itemName,
    required int quantity,
    required DateTime boughtDate,
    required DateTime expiryDate,
  }) async {
    try {
      InventoryItemModel item = InventoryItemModel(
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
