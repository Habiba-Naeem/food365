import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:food365/domain/modules/ordering/category.dart' as mycat;
import 'package:food365/domain/modules/ordering/menu_item.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

var httpClient = http.Client();
final baseURL = "https://food365-88d9d-default-rtdb.firebaseio.com/";

// class MenuService {
//   postCategory() async {
//     mycat.categories.forEach(
//       (category) => http.post(
//         Uri.parse(baseURL + "/Category.json"),
//         body: json.encode(
//           {
//             'name': category.name,
//           },
//         ),
//       ),
//     );
//   }

//   postMenuItem() async {
//     var response = await httpClient.get(Uri.parse(baseURL + "/Category.json"));
//      var data =
//         jsonDecode(response.body);
//      var l = data.enteries.forEach((e) {
//       print(e);
//       return mycat.Category.fromJson(e.key, e);
//     });
//     print(l);
//   }

//   getMenu() async {
//     var response = await httpClient.get(Uri.parse(baseURL + "/Category.json"));
//     Map<String, dynamic> data =
//         jsonDecode(response.body) as Map<String, dynamic>;
//     print(data);

//     //postCategory();
//     postMenuItem();
//     // categories = data.keys.map((d) => mycat.Category.fromJson(d)).toList();
//     // print( MenuItem.fromJson(data).name);
//     // print(data.entries.map((d) => MenuItem.fromJson(d)) );
//     //list = data.entries.map((d) => MenuItem.fromJson(d)).toList();
//     // categories.forEach((element) {
//     //   print(element);
//     // });
//     return data;
//   }
// }
