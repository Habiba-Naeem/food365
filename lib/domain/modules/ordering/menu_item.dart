import 'dart:convert';

import 'package:food365/domain/modules/ordering/category.dart' as mycat;

class MenuItem {
  mycat.Category category;
  String name;
  String description;
  double price;
  MenuItem({
    required this.category,
    required this.name,
    required this.description,
    required this.price,
  });
  factory MenuItem.fromJson(Map<String, dynamic> json) {
    print(json.values.first);
    return MenuItem(
        category: mycat.Category.fromJson('d', 'er'),
        name: json['name'],
        description: json['description'],
        price: json['price']);
  }
}

List<MenuItem> menuItems = [
  MenuItem(
      category: mycat.categories[0],
      name: "Tikka",
      description: "spicy tikka",
      price: 8),
  MenuItem(
      category: mycat.categories[2],
      name: "Naan",
      description: "spicy tikka",
      price: 8),
  MenuItem(
      category: mycat.categories[0],
      name: "Paratha",
      description: "spicy tikka",
      price: 8),
  MenuItem(
      category: mycat.categories[0],
      name: "Tikka",
      description: "spicy tikka",
      price: 8)
];
