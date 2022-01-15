class Cart {
  String category;
  String itemName;
  double price;
  int qunatity;

  Cart({
    required this.category,
    required this.itemName,
    required this.price,
    required this.qunatity,
  });
}

List<Cart> cartItems = [
  Cart(category: "Appetizers", itemName: "Crackers", price: 10.5, qunatity: 5),
  Cart(category: "Appetizers", itemName: "Water", price: 12, qunatity: 1),
  Cart(category: "BBQ", itemName: "Tikka", price: 200, qunatity: 2),
  Cart(category: "BBQ", itemName: "Malai boti", price: 105.5, qunatity: 2),
];
