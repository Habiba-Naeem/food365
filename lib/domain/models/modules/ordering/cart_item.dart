import 'package:food365/domain/models/modules/ordering/menu_item_model.dart';

class CartItem {
  String menuItemID;
  String menuName;
  double price;
  int quantity;

  CartItem({
    required this.menuItemID,
    required this.menuName,
    required this.price,
    required this.quantity,
  });
  Map<String, dynamic> toJson() => {
        "menuItemID": menuItemID,
        "menuName": menuName,
        "price": price,
        "quantity": quantity,
      };
}

List<CartItem> cartItems = [
  // CartItem(menu: menuItems[0], quantity: 5),
  // CartItem(menu: menuItems[1], quantity: 5),
  // CartItem(menu: menuItems[2], quantity: 5),
  // CartItem(menu: menuItems[3], quantity: 5),
  // CartItem(menu: menuItems[0], quantity: 5),
  // CartItem(menu: menuItems[1], quantity: 5),
  // CartItem(menu: menuItems[2], quantity: 5),
  // CartItem(menu: menuItems[3], quantity: 5),
  // CartItem(menu: menuItems[4], quantity: 5),
  // CartItem(menu: menuItems[4], quantity: 5),
  // CartItem(menu: menuItems[4], quantity: 5),
  // CartItem(menu: menuItems[4], quantity: 5),
];
