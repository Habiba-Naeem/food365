import 'package:food365/domain/modules/ordering/cart_item.dart';

class CartModel {
  List<CartItem> cartItems = [];
  
  double total = 0;
  CartModel({
    required this.cartItems,
  });
}

CartModel cart = CartModel(cartItems: cartItems);
