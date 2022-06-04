import 'dart:convert';

class Category {
  String id;
  String name;
  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson({
    required  json,
    required key,
  }) {
    print(json);
    return Category(id: key, name: json['name']);
  }
}

List<Category> categories = [
  Category(id: '1', name: "Appetizers"),
  Category(id: '2', name: "Burgers"),
  Category(id: '3', name: "Pizzas"),
  Category(id: '4', name: "Rolls and Sandwichs"),
  Category(id: '5', name: "BBQ"),
  Category(id: '6', name: "Salads"),
  Category(id: '7', name: "Deserts"),
  Category(id: '8', name: "Extras"),
];
