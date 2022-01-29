import 'dart:convert';

import 'package:food365/domain/modules/ordering/category.dart' as mycat;

class MenuItemModel {
  // mycat.Category category;
  String categoryID;
  String name;
  String description;
  double price;
  String imagePath;

  MenuItemModel({
    required this.categoryID,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });

  // factory MenuItemModel.fromJson(Map<String, dynamic> json) {
  //   print(json.values.first);
  //   return MenuItemModel(
  //       category: mycat.Category.fromJson('d', 'er'),
  //       name: json['name'],
  //       description: json['description'],
  //       price: json['price'],
  //       imagePath: "null",
  //       );
  // }
}

List<MenuItemModel> menuItems = [
  MenuItemModel(
    categoryID: "mycat.categories[0]",
    name: "Crackers",
    description: "LOREM",
    price: 10.2,
    imagePath: 'assets/images/menu_items/pie.png',
  ),
  MenuItemModel(
    categoryID: "mycat.categories[0]",
    name: "Soup",
    description: "Spicy corn soup",
    price: 12.2,
    imagePath: 'assets/images/menu_items/boiled_eggs.png',
  ),
  MenuItemModel(
    categoryID: "mycat.categories[0]",
    name: "Won Tons",
    description: "Fried wontons",
    price: 13.2,
    imagePath: 'assets/images/menu_items/mexicans.png',
  ),
  MenuItemModel(
    categoryID: "mycat.categories[4]",
    name: "Tikka",
    description: "Spicy tikka",
    price: 20,
    imagePath: 'assets/images/menu_items/pie.png',
  ),
  MenuItemModel(
    categoryID: "mycat.categories[4]",
    name: "Malai Boti",
    description: "Spicy tikka",
    price: 20,
    imagePath: 'assets/images/menu_items/salad.png',
  ),
  MenuItemModel(
    categoryID: "mycat.categories[4]",
    name: "Malai Boti",
    description: "Spicy tikka",
    price: 20,
    imagePath: 'assets/images/menu_items/salad.png',
  ),
  MenuItemModel(
    categoryID: "mycat.categories[4]",
    name: "Malai Boti",
    description: "Spicy tikka",
    price: 20,
    imagePath: 'assets/images/menu_items/pie.png',
  ),
  MenuItemModel(
    categoryID: "mycat.categories[7]",
    name: "Naan",
    description: "LOREM",
    price: 8,
    imagePath: 'assets/images/menu_items/pie.png',
  ),
  MenuItemModel(
    categoryID: "mycat.categories[7]",
    name: "Naan",
    description: "LOREM",
    price: 8,
    imagePath: 'assets/images/menu_items/pie.png',
  ),
  MenuItemModel(
    categoryID:" mycat.categories[7]",
    name: "Naan",
    description: "LOREM",
    price: 8,
    imagePath: 'assets/images/menu_items/pie.png',
  ),
];
