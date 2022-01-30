
import 'package:food365/domain/models/modules/ordering/menu_item_model.dart';

class CartItem {
  MenuItemModel menu;
  int quantity;

  CartItem({
    required this.menu,
    required this.quantity,
  });


  //CartItem.addToCart() => CartItem(menu: menu, quantity: quantity)
}

List<CartItem> cartItems = [
  CartItem(menu: menuItems[0], quantity: 5),
  CartItem(menu: menuItems[1], quantity: 5),
  CartItem(menu: menuItems[2], quantity: 5),
  CartItem(menu: menuItems[3], quantity: 5),
  CartItem(menu: menuItems[0], quantity: 5),
  CartItem(menu: menuItems[1], quantity: 5),
  CartItem(menu: menuItems[2], quantity: 5),
  CartItem(menu: menuItems[3], quantity: 5),
  CartItem(menu: menuItems[4], quantity: 5),
  CartItem(menu: menuItems[4], quantity: 5),
  CartItem(menu: menuItems[4], quantity: 5),
  CartItem(menu: menuItems[4], quantity: 5),
];
