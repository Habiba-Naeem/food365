import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:food365/domain/models/modules/ordering/category.dart' as mycat;

class MenuItemModel {
  String? itemID;
  String categoryID;
  String name;
  String description;
  double price;
  Duration time;
  //double time;
  String imagePath;

  MenuItemModel({
    required this.itemID,
    required this.categoryID,
    required this.name,
    required this.description,
    required this.price,
    required this.time,
    required this.imagePath,
  });

  MenuItemModel.postMenu({
    required this.categoryID,
    required this.name,
    required this.description,
    required this.price,
    required this.time,
    required this.imagePath,
  });

  factory MenuItemModel.fromJson({
    required json,
    required key,
  }) {
    return MenuItemModel(
      itemID: key,
      categoryID: json["categoryID"],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      time: json['time'],
      imagePath: json['imagePath'],
    );
  }

  Map<String, dynamic> toJson() => {
        "itemID": itemID,
        "categoryID": categoryID,
        "name": name,
        "description": description,
        "price": price,
        "imagePath": imagePath,
        "time": time
      };
}

// List<MenuItemModel> menuItems = [
//   MenuItemModel(
//     categoryID: "mycat.categories[0]",
//     name: "Crackers",
//     description: "LOREM",
//     price: 10.2,
//     imagePath: 'assets/images/menu_items/boiled_eggs.png',
//     itemID: '',
//   ),
//   MenuItemModel(
//     categoryID: "mycat.categories[0]",
//     name: "Soup",
//     description: "Spicy corn soup",
//     price: 12.2,
//     imagePath: 'assets/images/menu_items/boiled_eggs.png',
//     itemID: '',
//   ),
//   MenuItemModel(
//     categoryID: "mycat.categories[0]",
//     name: "Won Tons",
//     description: "Fried wontons",
//     price: 13.2,
//     imagePath: 'assets/images/menu_items/mexican.png',
//     itemID: '',
//   ),
//   MenuItemModel(
//     categoryID: "mycat.categories[4]",
//     name: "Tikka",
//     description: "Spicy tikka",
//     price: 20,
//     imagePath: 'assets/images/menu_items/mexican.png',
//     itemID: '',
//   ),
//   MenuItemModel(
//     categoryID: "mycat.categories[4]",
//     name: "Malai Boti",
//     description: "Creamy malai boti",
//     price: 20,
//     imagePath: 'assets/images/menu_items/salad.png',
//     itemID: '',
//   ),
//   MenuItemModel(
//     categoryID: "mycat.categories[4]",
//     name: "Reshmi Kebab",
//     description: "Soft kebab",
//     price: 20,
//     imagePath: 'assets/images/menu_items/salad.png',
//     itemID: '',
//   ),
//   MenuItemModel(
//     categoryID: "mycat.categories[7]",
//     name: "Naan",
//     description: "Naan",
//     price: 8,
//     imagePath: 'assets/images/menu_items/mexican.png',
//     itemID: '',
//   ),
//   MenuItemModel(
//     categoryID: "mycat.categories[7]",
//     name: "Strawberry Ice cream",
//     description: "Creamy ice cream",
//     price: 8,
//     imagePath: 'assets/images/menu_items/pie.png',
//     itemID: '',
//   ),
// ];
