import 'dart:async';
import 'dart:convert';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:food365/domain/modules/ordering/category.dart' as mycat;
import 'package:food365/domain/modules/ordering/menu_item_model.dart';

var httpClient = http.Client();
const baseURL = "https://food365-88d9d-default-rtdb.firebaseio.com/";
const categoriesURL = "/Categories.json";
const menuURL = "/MenuItems.json";

class MenuService {
  getCategories() async {
    var response = await httpClient.get(Uri.parse(baseURL + categoriesURL));

    Map<String, dynamic> data =
        jsonDecode(response.body) as Map<String, dynamic>;

    List<mycat.Category> categories = data.entries.map((e) {
      return mycat.Category.fromJson(json: e.value, key: e.key);
    }).toList();

    return categories;
  }

  // postCategories() async {
  //   var response = mycat.categories.forEach(
  //     (category) => http
  //         .post(
  //           Uri.parse(baseURL + categoriesURL),
  //           body: json.encode(
  //             {
  //               'name': category.name,
  //             },
  //           ),
  //         )
  //         .then((value) => print(jsonDecode(value.body))),
  //   );
  // }

  postMenuItem({
    required String categoryID,
    required String name,
    required String description,
    required double price,
    required String imagePath,
  }) async {

    MenuItemModel menuItem = MenuItemModel(
        categoryID: categoryID,
        name: name,
        description: description,
        price: price,
        imagePath: imagePath);

    var response = await httpClient.post(Uri.parse(baseURL + menuURL),
        body: jsonEncode(menuItem));
    
  }

  getMenu() async {
    var response = await httpClient.get(Uri.parse(baseURL + "/Category.json"));
    Map<String, dynamic> data =
        jsonDecode(response.body) as Map<String, dynamic>;
    print(data);

    //postCategory();
    //postMenuItem();
    // categories = data.keys.map((d) => mycat.Category.fromJson(d)).toList();
    // print( MenuItem.fromJson(data).name);
    // print(data.entries.map((d) => MenuItem.fromJson(d)) );
    //list = data.entries.map((d) => MenuItem.fromJson(d)).toList();
    // categories.forEach((element) {
    //   print(element);
    // });
    return data;
  }
}
