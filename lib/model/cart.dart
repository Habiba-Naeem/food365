class Cart {
  String category;
  String itemName;
  double price;
  int quantity;

  Cart({
    required this.category,
    required this.itemName,
    required this.price,
    required this.quantity,
  });
}


//DUMMY DATA. THIS IS DEFINETLY NOT THE PROPER DATABASE DESIGN

List<Cart> cartItems = [
  Cart(category: "Appetizers", itemName: "Crackers", price: 10.5, quantity: 5),
  Cart(category: "Appetizers", itemName: "Water", price: 12, quantity: 1),
  Cart(category: "BBQ", itemName: "Tikka", price: 200, quantity: 2),
  Cart(category: "BBQ", itemName: "Malai boti", price: 105.5, quantity: 2),
];
