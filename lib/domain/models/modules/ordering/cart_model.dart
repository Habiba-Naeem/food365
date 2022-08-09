import 'package:flutter/foundation.dart';
import 'package:food365/domain/models/modules/ordering/cart_item.dart';

class CartModel extends ChangeNotifier {
  List<CartItem> cartItems = [];
  double total = 0;

  // CartModel({
  //    this.cartItems,
  // });

  List<CartItem> get allCartItems => cartItems;
  double get totalPrice => double.parse((total).toStringAsFixed(2));
  

  Map<String, dynamic> toJson() => {
        "cartItems": cartItems,
        "total": total,
      };

  bool addItem(CartItem cartItem) {
    // for (CartItem cart in cartItems) {
    //   if (cartItem.menuItemID == cart.menuItemID) {
    //     print("cartitem");
    //     print(cartItem.price);
    //     print(cartItem.quantity);
    //     total = total + (cartItem.price*cartItem.quantity);
    //
    //     print(cartItem);
    //     return true;
    //   }
    // }
    if(cartItems.indexWhere((element) => element.menuName==cartItem.menuName)>=0){
      cartItems[cartItems.indexWhere((element) => element.menuName==cartItem.menuName)].quantity++;

    }
    else{

      cartItems.add(cartItem);
    }
    print("cartitem");
    print(cartItem.price);
    print(cartItem.quantity);
    total = total + (cartItem.price);

    print(cartItems);
    notifyListeners();
    return true;
  }
void resetState(){
    total=0;cartItems=[];
    notifyListeners();
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
    print("total");
    print(total);
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
