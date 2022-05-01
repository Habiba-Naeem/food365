import 'package:flutter/cupertino.dart';
import 'package:food365/domain/models/modules/ordering/cart_item.dart';
import 'package:food365/domain/services/order_service.dart';
import 'package:food365/utils/constants.dart';
import 'package:food365/utils/exceptions.dart';
import 'package:food365/utils/shared/widgets/dialogs.dart';

class CheckoutController extends ChangeNotifier {
  double total = 0;
  List<CartItem> cartItems = [];
  bool isLoading = false;

  CheckoutController({
    required this.total,
    required this.cartItems,
  });

  Future checkOut() async {
    isLoading = !isLoading;
    notifyListeners();
    try {
      var response =
          await OrderService().postOrder(totalPrice: total, items: cartItems);
      if (response == success) {
        isLoading = !isLoading;
        return success;
      }
    } on SomethingWentWrong catch (e) {
      isLoading = !isLoading;
      return e.cause;
      //showErrorDialog(context, e.cause);
    } on DatabaseNotFound catch (e) {
      // isLoading = !isLoading;
      // showErrorDialog(context, e.cause);
      return e.cause;
    } on ServiceUnavailable catch (e) {
      // isLoading = !isLoading;
      // showErrorDialog(context, e.cause);
      return e.cause;
    } 
  }
}
