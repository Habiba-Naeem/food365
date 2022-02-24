import 'dart:convert';
import 'package:food365/domain/models/modules/ordering/category.dart' as mycat;
import 'package:food365/domain/models/modules/ordering/menu_item_model.dart';
import 'package:food365/domain/models/modules/ordering/order.dart';
import 'package:http/http.dart' as http;

var httpClient = http.Client();
const baseURL = "https://food365-afac9-default-rtdb.firebaseio.com/";
const cartURL = "/Cart";
const jsonVariable = '.json';

class CartService {
  postCartItem({
    required serviceStatus,
    required cookingStatus,
    required orderID,
    required createdAt,
    required updatedAt,
    required totalPrice,
    required cart,
  }) async {
    
    // var response = await httpClient.post(
    //     Uri.parse(baseURL + cartURL + jsonVariable),
    //     body: jsonEncode(.toJson()));
  }
}
