import 'package:flutter/foundation.dart';
import 'package:food365/domain/models/modules/ordering/cart_item.dart';

class CartModel extends ChangeNotifier  {
  List<CartItem> cartItems = [];

  double total = 0;
  // CartModel({
  //   required this.cartItems,
  // });

  List<CartItem> get allCartItems => cartItems;

  bool addItem(CartItem cartItem) {
    for (CartItem cart in cartItems) {
      if (cartItem.menu.name == cart.menu.name) {
        cartItems[cartItems.indexOf(cart)].quantity++;
        print(cartItem);
        return true;
      }
    }
    cartItems.add(cartItem);
    print(cartItems);
    notifyListeners();
    return true;
  }
  void decreaseItem(CartItem cartModel) {
    if (cartItems[cartItems.indexOf(cartModel)].quantity <= 1) {
      return;
    }
    cartItems[cartItems.indexOf(cartModel)].quantity--;
   // cartItems[cartItems.indexOf(cartModel)].menu.price = cartItems[cartItems.indexOf(cartModel)].quantity--;
    notifyListeners();
  }

  void increaseItem(CartItem cartModel) {
    cartItems[cartItems.indexOf(cartModel)].quantity++;
    notifyListeners();
  }

  void removeAllInCart(CartItem cartItem) {
    cartItems.removeWhere((item) {
      return item.menu.name == cartItem.menu.name;
    });
    notifyListeners();
  }
}

