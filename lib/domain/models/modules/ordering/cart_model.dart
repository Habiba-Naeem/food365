import 'package:flutter/foundation.dart';
import 'package:food365/domain/models/modules/ordering/cart_item.dart';

class CartModel extends ChangeNotifier {
  List<CartItem> cartItems = [];
  double total = 0;

  // CartModel({
  //   required this.cartItems,
  // });

  List<CartItem> get allCartItems => cartItems;
  double get totalPrice => double.parse((total).toStringAsFixed(2));
  

  Map<String, dynamic> toJson() => {
        "cartItems": cartItems,
        "total": total,
      };

  bool addItem(CartItem cartItem) {
    for (CartItem cart in cartItems) {
      if (cartItem.menuItemID == cart.menuItemID) {
        cartItems[cartItems.indexOf(cart)].quantity++;
        print(cartItem);
        return true;
      }
    }
    total = total + cartItem.price;
    cartItems.add(cartItem);
    print(cartItems);
    notifyListeners();
    return true;
  }

  void decreaseItem(CartItem cartItem) {
    if (cartItems[cartItems.indexOf(cartItem)].quantity <= 1) {
      return;
    }
    total = total - cartItem.price;
    cartItems[cartItems.indexOf(cartItem)].quantity--;
    // cartItems[cartItems.indexOf(cartModel)].menu.price = cartItems[cartItems.indexOf(cartModel)].quantity--;
    notifyListeners();
  }

  void increaseItem(CartItem cartItem) {
    total = total + cartItem.price;
    cartItems[cartItems.indexOf(cartItem)].quantity++;

    notifyListeners();
  }

  void removeAllInCart(CartItem cartItem) {
    cartItems.removeWhere((item) {
      return item.menuItemID == cartItem.menuItemID;
    });
    notifyListeners();
  }
}
