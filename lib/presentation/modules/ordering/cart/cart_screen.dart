import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food365/domain/models/modules/ordering/cart_model.dart';
import 'package:food365/domain/models/modules/ordering/menu_item_model.dart';
import 'package:food365/domain/services/menu_service.dart';
import 'package:food365/presentation/modules/ordering/cart/cart_item.dart';
import 'package:food365/presentation/modules/ordering/checkout/views/checkout_screen.dart';
import 'package:food365/utils/constants.dart';
import 'package:food365/utils/shared/custom_appbar.dart';
import 'package:food365/utils/shared/custom_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/custom_style.dart';

class CartScreen extends StatelessWidget {
  static const String id = 'cart item';
  const CartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartModel = Provider.of<CartModel>(context);
    return Scaffold(

      appBar: AppBar(
        title: Text("Cart",style: CustomStyle.appbarTitleStyle,),
        backgroundColor: CustomColor.primaryColor,
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.arrowAltCircleLeft, color: CustomColor.whiteColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),

      bottomNavigationBar:CustomBottomNavBar(
        id: CartScreen.id,
      ),
      // CustomBottomNavBar(
      //   id: CartScreen.id,
      // ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 24.0,bottom: 24),
              child: Text('Menu Items', style: headerStyle),
            ),
            Expanded(
              child: Consumer<CartModel>(
                builder: (context, cart, child) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cart.allCartItems.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return StreamProvider<List<MenuItemModel>>.value(
                        initialData: [],
                        value: MenuService().getMenuItems(),
                        child: CartItems(cartItem: cart.allCartItems[index]),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                    'Total: ',
                    style: headerStyle),
                Text(
                    '\$ ${cartModel.totalPrice}',
                    style: headerStyle),
              ],
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(top: 24, bottom: 64),
                width: double.infinity,
                child: RaisedButton(
                  child: Text(
                    'Checkout',
                    style: CustomStyle.appbarTitleStyle,
                  ),
                  onPressed: () {
                    if(cartModel.totalPrice>0) {

                      Navigator.of(context).pop();
                      Navigator.of(context)
                          .pushReplacementNamed(CheckoutScreen.id);
                    }
                    else{

                    }
                  },
                  padding: EdgeInsets.symmetric(horizontal: 64, vertical: 12),
                  color: CustomColor.primaryColor,
                  shape: StadiumBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
