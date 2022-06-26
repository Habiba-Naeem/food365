import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food365/domain/models/modules/ordering/cart_model.dart';
import 'package:food365/domain/models/modules/ordering/order.dart';
import 'package:food365/domain/services/order_service.dart';
import 'package:food365/presentation/modules/ordering/checkout/controller/checkout_controller.dart';
import 'package:food365/presentation/modules/ordering/checkout/views/timer.dart';
import 'package:food365/utils/constants.dart';
import 'package:food365/utils/exceptions.dart';
import 'package:food365/utils/shared/loading.dart';
import 'package:food365/utils/shared/widgets/dialogs.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  static const String id = "checkout";
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Text('Checkout', style: headerStyle),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Total:6776', style: headerStyle),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 24, bottom: 64),
                  width: double.infinity,
                  child: RaisedButton(
                    child: loading
                        ? SpinKitChasingDots(color: Colors.blue, size: 20)
                        : Text('Confirm Order', style: titleStyle),
                    onPressed: () async {
                      // CheckoutController(
                      //   cartItems: Provider.of<CartModel>(context).allCartItems,
                      //   total: Provider.of<CartModel>(context).totalPrice,
                      // ).checkOut();
                      // Provider.of<CheckoutController>(context).isLoading
                      //     ? context.loaderOverlay.show()
                      //     : context.loaderOverlay.hide();
                      context.loaderOverlay.show();
                      try {
                        var response = await OrderService().postOrder(
                            totalPrice:
                                Provider.of<CartModel>(context, listen: false)
                                    .total,
                            items:
                                Provider.of<CartModel>(context, listen: false)
                                    .allCartItems);
                        if (response["success"] == success) {
                          context.loaderOverlay.hide();
                          await showAlertDialog(context);
                          // FutureProvider<OrderModel>.value(
                          //   value: response['order'],
                          //   child: MyHomePage(order: response['order'],)
                          // );
                          Navigator.of(context).pushNamed(MyHomePage.id,
                              arguments: response['order']);
                        }
                      } on SomethingWentWrong catch (e) {
                        context.loaderOverlay.hide();
                        showErrorDialog(context, e.cause);
                      } on DatabaseNotFound catch (e) {
                        context.loaderOverlay.hide();
                        showErrorDialog(context, e.cause);
                      } on ServiceUnavailable catch (e) {
                        context.loaderOverlay.hide();
                        showErrorDialog(context, e.cause);
                      } on SocketException catch (e) {
                        context.loaderOverlay.hide();
                        showErrorDialog(context, noInternet);
                      }
                    },
                    padding: EdgeInsets.symmetric(horizontal: 64, vertical: 12),
                    color: mainColor,
                    shape: StadiumBorder(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// showAlertDialog(BuildContext context) {
//   // Create button
//   Widget okButton = FlatButton(
//     child: Text("OK"),
//     color: Colors.teal,
//     onPressed: () {
//       Navigator.of(context).pop();
//     },
//   );

//   AlertDialog alert = AlertDialog(
//     title: Text("Order Confirmation"),
//     content: Text("Your Order has been placed. Thank you!"),
//     actions: [
//       okButton,
//     ],
//   );

//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }

// showErrorDialog(BuildContext context, String cause) {
//   // Create button
//   Widget okButton = FlatButton(
//     child: Text("OK"),
//     color: Colors.teal,
//     onPressed: () {
//       Navigator.of(context).pop();
//     },
//   );

//   AlertDialog alert = AlertDialog(
//     title: Text("Error Occured"),
//     content: Text(cause),
//     actions: [
//       okButton,
//     ],
//   );

//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }
