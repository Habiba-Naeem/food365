class CartItem {
  String category;
  String itemName;
  double price;
  int quantity;

  CartItem({
    required this.category,
    required this.itemName,
    required this.price,
    required this.quantity,
  });
}

List<CartItem> cartItems = [
  CartItem(
      category: "Appetizers", itemName: "Crackers", price: 10.5, quantity: 5),
  CartItem(category: "Appetizers", itemName: "Water", price: 12, quantity: 1),
  CartItem(category: "BBQ", itemName: "Tikka", price: 200, quantity: 2),
  CartItem(category: "BBQ", itemName: "Malai boti", price: 105.5, quantity: 2),
];
