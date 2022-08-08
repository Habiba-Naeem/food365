import 'dart:convert';

import 'package:duration/duration.dart';
import 'package:flutter/material.dart';

import 'package:food365/domain/models/modules/ordering/category.dart' as mycat;

class MenuItemModel {
  String itemID;
  String categoryID;
  String name;
  String description;
  double price;
  Duration time;
  String imagePath;
  bool famous = false;

  MenuItemModel({
    this.itemID,
    this.categoryID,
    this.name,
    this.description,
    this.price,
    this.time,
    this.imagePath,
    this.famous,
  });

  MenuItemModel.postMenu({
    this.categoryID,
    this.name,
    this.description,
    this.price,
    this.time,
  });

  factory MenuItemModel.fromJson({
    json,
    key,
  }) {
    return MenuItemModel(
        itemID: key,
        categoryID: json["categoryID"],
        name: json['name'],
        description: json['description'],
        price: json['price'],
        time: parseTime(json['time']),
        imagePath: json['imagePath'],
        famous: json['famous']);
  }

  Map<String, dynamic> toJson() => {
        "itemID": itemID,
        "categoryID": categoryID,
        "name": name,
        "description": description,
        "price": price,
        "imagePath": imagePath,
        "time": time.toString(),
        'famous': famous
      };
}
