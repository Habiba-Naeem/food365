import 'package:flutter/material.dart';
import 'package:food365/presentation/modules/ordering/cart/cart_items.dart';
import 'package:food365/presentation/modules/staff/waiter/side_drawer.dart';
import 'package:food365/presentation/shared/custom_bottom_nav_bar.dart';
import 'package:food365/presentation/utils/constants.dart';

class CartScreen extends StatelessWidget {
  static const String id = 'cart item';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomSideDrawer(),
      bottomNavigationBar: CustomBottomNavBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Text('Cart', style: headerStyle),
              ),
              // ...buildHeader(),
              //cart items list
              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                // controller: scrollController,
                itemBuilder: (BuildContext context, int index) {
                  return CartItems();
                },
              ),
              SizedBox(height: 16),
              Divider(),
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
                  child: Text('Checkout', style: titleStyle),
                  onPressed: () {
                    //onCheckOutClick(cart);
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
