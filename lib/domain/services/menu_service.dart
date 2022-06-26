import 'dart:convert';
import 'dart:io';
import 'package:food365/domain/models/modules/ordering/api_response.dart';
import 'package:food365/domain/models/modules/ordering/category.dart' as mycat;
import 'package:food365/domain/models/modules/ordering/menu_item_model.dart';
import 'package:food365/domain/services/image_service.dart';
import 'package:food365/utils/constants.dart';
import 'package:http/http.dart' as http;

import 'package:firebase_database/firebase_database.dart';

var httpClient = http.Client();
const baseURL = "https://food365-264fb-default-rtdb.firebaseio.com/";
const categoriesURL = "/Categories";
const menuURL = "/MenuItems";
const jsonVariable = '.json';
FirebaseDatabase database = FirebaseDatabase.instance;

class MenuService {
  Stream<List<MenuItemModel>> getMenuItems() {
    Stream<DatabaseEvent> stream =
        FirebaseDatabase.instance.ref(menuURL).onValue;
    final streamToPublish = stream.map((event) {
      List<MenuItemModel> menuList = [];
      Map<String, dynamic>.from(event.snapshot.value as dynamic).forEach(
        (key, value) async {
          menuList.add(
            MenuItemModel.fromJson(json: value, key: key),
          );
        },
      );
      print(menuList);
      return menuList;
    });
    return streamToPublish.asBroadcastStream();
    // try {
    //   var response =
    //       await httpClient.get(Uri.parse(baseURL + menuURL + jsonVariable));
    //   print(response.statusCode);
    //   Map<String, dynamic> data =
    //       jsonDecode(response.body) as Map<String, dynamic>;

    //   List<MenuItemModel> menuItems = data.entries
    //       .map((e) => MenuItemModel.fromJson(json: e.value, key: e.key))
    //       .toList();

    //   var parsedResponse = ApiResponse.fromJson(response.statusCode);

    //   if (response.statusCode == 200) {
    //     return menuItems;
    //   }
    //   throw parsedResponse.returnException();
    // } on SocketException catch (e) {
    //   return [];
    // }
  }

  getMenuItem({
    required menuItemID,
  }) async {
    try {
      var response = await httpClient.get(Uri.parse(
          baseURL + menuURL + '/' + menuItemID.toString() + jsonVariable));
      Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;
      MenuItemModel menuItem =
          MenuItemModel.fromJson(json: data, key: menuItemID);

      var parsedResponse = ApiResponse.fromJson(response.statusCode);

      if (response.statusCode == 200) {
        return menuItem;
      }
      throw parsedResponse.returnException();
    } on SocketException catch (e) {
      return;
    }
  }

  deleteMenuItem({required String menuItemID}) async {
    try {
      var response = await httpClient.delete(
        Uri.parse(
            baseURL + menuURL + '/' + menuItemID.toString() + jsonVariable),
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

  updateMenuItem({
    required MenuItemModel item,
    required File image,
  }) async {
    try {
      var response = await httpClient.patch(
          Uri.parse(
              baseURL + menuURL + '/' + item.itemID.toString() + jsonVariable),
          body: jsonEncode(item.toJson()));
      var parsedResponse = ApiResponse.fromJson(response.statusCode);
      Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode == 200) {
        ImageService().uploadImage(image: image, menuItemId: item.itemID);
        return success;
      }
      throw parsedResponse.returnException();
    } on SocketException catch (e) {
      return noInternet;
    }
  }

  postMenuItem({
    required String categoryID,
    required String name,
    required String description,
    required double price,
    required Duration time,
    required String imagePath,
    required File image,
  }) async {
    try {
      MenuItemModel menuItem = MenuItemModel.postMenu(
        categoryID: categoryID,
        name: name,
        description: description,
        price: price,
        time: time,
        //imagePath: "assets/images/menu_items/salad.png",
      );

      var response = await httpClient.post(
          Uri.parse(baseURL + menuURL + jsonVariable),
          body: jsonEncode(menuItem.toJson()));

      var parsedResponse = ApiResponse.fromJson(response.statusCode);

      Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode == 200) {
        ImageService().uploadImage(image: image, menuItemId: data.values.first);
        return success;
      }
      throw parsedResponse.returnException();
    } on SocketException catch (e) {
      return noInternet;
    }
  }
}


// Future<List<mycat.Category>> getCategories() async {
//     var response = await httpClient.get(
//       Uri.parse(baseURL + categoriesURL + jsonVariable),
//     );

//     Map<String, dynamic> data =
//         jsonDecode(response.body) as Map<String, dynamic>;

//     List<mycat.Category> categories = data.entries.map((e) {
//       return mycat.Category.fromJson(json: e.value, key: e.key);
//     }).toList();

//     return categories;
//   }

//   postCategories() async {
//     try {
//       var response = mycat.categories.forEach(
//         (category) => http
//             .post(
//               Uri.parse(baseURL + categoriesURL + jsonVariable),
//               body: json.encode(
//                 {
//                   'name': category.name,
//                 },
//               ),
//             )
//             .then((value) => print(jsonDecode(value.body))),
//       );
//     } on Exception catch (e) {
//       // TODO
//     }
//   }
