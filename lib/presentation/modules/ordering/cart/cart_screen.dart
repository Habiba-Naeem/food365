import 'package:flutter/material.dart';
import 'package:food365/domain/models/modules/ordering/cart_model.dart';
import 'package:food365/presentation/modules/ordering/cart/cart_item.dart';
import 'package:food365/presentation/modules/ordering/checkout/views/checkout_screen.dart';
import 'package:food365/utils/constants.dart';
import 'package:food365/utils/shared/custom_appbar.dart';
import 'package:food365/utils/shared/custom_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const String id = 'cart item';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBar(
        headingText: "Cart",
        height: 116.0,
      ),
      // appBar: AppBar(
      //   title: Text("Menu"),
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.shopping_cart_sharp),
      //       onPressed: () {
      //         Navigator.of(context).pushNamed(CartScreen.id);
      //       },
      //     )
      //   ],
      // ),
      bottomNavigationBar: CustomBottomNavBar(
        id: CartScreen.id,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Text('Cart', style: headerStyle),
              ),
              Consumer<CartModel>(
                builder: (context, cart, child) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cart.cartItems.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      print(cart.cartItems);

                      return CartItems(cartItem: cart.cartItems[index]);
                    },
                  );
                },
              ),
              SizedBox(height: 16),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                      '\$ ${Provider.of<CartModel>(context, listen: false).total.toStringAsFixed(2)}',
                      style: headerStyle),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 24, bottom: 64),
                width: double.infinity,
                child: RaisedButton(
                  child: Text(
                    'Checkout',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(CheckoutScreen.id);
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
    );
  }
}
