import 'dart:convert';
import 'package:food365/domain/models/modules/ordering/category.dart' as mycat;
import 'package:food365/domain/models/modules/ordering/menu_item_model.dart';
import 'package:http/http.dart' as http;

var httpClient = http.Client();
const baseURL = "https://food365-88d9d-default-rtdb.firebaseio.com/";
const categoriesURL = "/Categories";
const menuURL = "/MenuItems";
const jsonVaribale = '.json';

class MenuService {
  Future<List<mycat.Category>> getCategories() async {
    var response =
        await httpClient.get(Uri.parse(baseURL + categoriesURL + jsonVaribale));

    Map<String, dynamic> data =
        jsonDecode(response.body) as Map<String, dynamic>;

    List<mycat.Category> categories = data.entries.map((e) {
      return mycat.Category.fromJson(json: e.value, key: e.key);
    }).toList();
    print(categories);
    return categories;
  }

  getMenuItems() async {
    var response =
        await httpClient.get(Uri.parse(baseURL + menuURL + jsonVaribale));

    Map<String, dynamic> data =
        jsonDecode(response.body) as Map<String, dynamic>;

    List<MenuItemModel> menuItems = data.entries
        .map((e) => MenuItemModel.fromJson(json: e.value, key: e.key))
        .toList();
    print(menuItems);
    return menuItems;
  }

  updateMenuItem({
    required String itemID,
    required String name,
    required String description,
    required double price,
    required String imagePath,
  }) async {
    String id = '/' + itemID + '.json';
    print(id);
    var response = await httpClient.patch(
      Uri.parse(baseURL + menuURL + '/$itemID' + jsonVaribale),
      body: json.encode(
        {
          "name": name,
          "description": description,
          "price": price,
          "imagePath": imagePath
        },
      ),
    );
    print(jsonDecode(response.body));
  }

  postMenuItem({
    required String categoryID,
    required String name,
    required String description,
    required double price,
    required String imagePath,
  }) async {
    MenuItemModel menuItem = MenuItemModel.postMenu(
        itemID: '',
        categoryID: categoryID,
        name: name,
        description: description,
        price: price,
        imagePath: imagePath);

    var response = await httpClient.post(Uri.parse(baseURL + menuURL),
        body: jsonEncode(menuItem.toJson()));
  }

  getMenu() async {
    List<mycat.Category> allCategories = await getCategories();
    List<MenuItemModel> allmenuItems = await getMenuItems();
  }
}


 // menuItems.forEach((item, {index = 0}) {
      //   if (e.value['name'] == mycat.categories[0].name) {
      //     updateMenuItem(
      //         orderBy: e.key,
      //         itemID: item.itemID,
      //         name: appetizers[index]['name'],
      //         description: appetizers[index]['description'],
      //         price: appetizers[index]['price'],
      //         imagePath: appetizers[index]['imagePath']);
      //   }
      //   //index++;
      // });

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

//   List appetizers = [
//   {
//     "name": "Crackers",
//     "description": "Sharp crackers",
//     "price": 10.2,
//     "imagePath": 'assets/images/menu_items/boiled_eggs.png',
//   },
//   {
//     "name": "Soup",
//     "description": "Spicy chicken soup",
//     "price": 14.2,
//     "imagePath": 'assets/images/menu_items/boiled_eggs.png',
//   },
//   {
//     "name": "WonTons",
//     "description": "Fried wontons",
//     "price": 5.2,
//     "imagePath": 'assets/images/menu_items/boiled_eggs.png',
//   }
// ];