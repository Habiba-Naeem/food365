import 'dart:convert';
import 'package:food365/domain/models/modules/ordering/category.dart' as mycat;
import 'package:food365/domain/models/modules/ordering/menu_item_model.dart';
import 'package:http/http.dart' as http;

var httpClient = http.Client();
const baseURL = "https://food365-89950-default-rtdb.firebaseio.com/";
const categoriesURL = "/Categories";
const menuURL = "/MenuItems";
const jsonVariable = '.json';

class MenuService {
  Future<List<mycat.Category>> getCategories() async {
    var response = await httpClient.get(
      Uri.parse(baseURL + categoriesURL + jsonVariable),
    );

    Map<String, dynamic> data =
        jsonDecode(response.body) as Map<String, dynamic>;

    List<mycat.Category> categories = data.entries.map((e) {
      return mycat.Category.fromJson(json: e.value, key: e.key);
    }).toList();

    return categories;
  }

  postCategories() async {
    var response = mycat.categories.forEach(
      (category) => http
          .post(
            Uri.parse(baseURL + categoriesURL + jsonVariable),
            body: json.encode(
              {
                'name': category.name,
              },
            ),
          )
          .then((value) => print(jsonDecode(value.body))),
    );
  }

  Future<List<MenuItemModel>> getMenuItems() async {
    var response =
        await httpClient.get(Uri.parse(baseURL + menuURL + jsonVariable));
    print(response.statusCode);
    Map<String, dynamic> data =
        jsonDecode(response.body) as Map<String, dynamic>;

    List<MenuItemModel> menuItems = data.entries
        .map((e) => MenuItemModel.fromJson(json: e.value, key: e.key))
        .toList();
        
    return menuItems;
  }

  Future<MenuItemModel> getMenuItem({
    required menuItemID,
  }) async {
    var response = await httpClient.get(Uri.parse(
        baseURL + menuURL + '/' + menuItemID.toString() + jsonVariable));
    Map<String, dynamic> data =
        jsonDecode(response.body) as Map<String, dynamic>;
    return data.values.first;
  }

  updateMenuItem({required MenuItemModel item}) async {
    var response = await httpClient.patch(
        Uri.parse(
            baseURL + menuURL + '/' + item.itemID.toString() + jsonVariable),
        body: jsonEncode(item.toJson()));
    print(jsonDecode(response.body));
  }

  postMenuItem({
    required String categoryID,
    required String name,
    required String description,
    required double price,
    required double time,
    required String imagePath,
  }) async {
    MenuItemModel menuItem = MenuItemModel.postMenu(
      categoryID: categoryID,
      name: name,
      description: description,
      price: price,
      time: time,
      imagePath: 'assets/images/menu_items/salad.png',
    );

    var response = await httpClient.post(
        Uri.parse(baseURL + menuURL + jsonVariable),
        body: jsonEncode(menuItem.toJson()));
    return response.statusCode;
  }
}
