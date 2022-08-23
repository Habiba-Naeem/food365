import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

import '../../../../../utils/colors.dart';
import '../../../../../utils/custom_style.dart';

class CheckoutScreen extends StatefulWidget {
  static const String id = "checkout";
  final String amount;
  const CheckoutScreen({Key key, this.amount}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final cartModel = Provider.of<CartModel>(context);
    return LoaderOverlay(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Checkout",
            style: CustomStyle.appbarTitleStyle,
          ),
          backgroundColor: CustomColor.primaryColor,
          leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowAltCircleLeft,
                color: CustomColor.whiteColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(top: 24, bottom: 64, left: 24, right: 24),
          width: double.infinity,
          child: RaisedButton(
            child: loading
                ? SpinKitChasingDots(color: Colors.blue, size: 20)
                : Text('Confirm Order', style: titleStyle),
            onPressed: () async {
              if (cartModel.totalPrice < 0) {
                return;
              }

              try {
                context.loaderOverlay.show();
                var response = await OrderService().postOrder(
                    totalPrice: cartModel.totalPrice,
                    items: cartModel.allCartItems);
                if (response["success"] == success) {
                   showAlertDialog(context);
                   context.loaderOverlay.hide();
                  cartModel.resetState();

                  Navigator.of(context)
                      .pushNamed(TimePage.id, arguments: response["order"]);
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
            color: AppColors.primaryColor,
            shape: StadiumBorder(),
          ),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Total',
                  style:
                      CustomStyle.headingStyle.merge(TextStyle(fontSize: 32))),
              Text('Rs. ${cartModel.totalPrice ?? ""}',
                  style:
                      CustomStyle.headingStyle.merge(TextStyle(fontSize: 28))),
            ],
          ),
        ),
      ),
    );
  }
}
