import 'package:flutter/material.dart';
import 'package:food365/domain/models/modules/ordering/cart_model.dart';
import 'package:food365/presentation/modules/ordering/cart/cart_item.dart';
import 'package:food365/presentation/modules/ordering/checkout/checkout_screen.dart';
import 'package:food365/presentation/modules/staff/waiter/side_drawer.dart';
import 'package:food365/presentation/shared/custom_bottom_nav_bar.dart';
import 'package:food365/presentation/utils/constants.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const String id = 'cart item';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_sharp),
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreen.id);
            },
          )
        ],
      ),
      drawer: CustomSideDrawer(),
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
                      '${Provider.of<CartModel>(context, listen: false).total}',
                      style: headerStyle),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 24, bottom: 64),
                width: double.infinity,
                child: RaisedButton(
                  child: Text('Checkout', style: titleStyle),
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
