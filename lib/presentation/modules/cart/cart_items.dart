import 'package:flutter/material.dart';
import 'package:food365/model/cart.dart';

class CartItem extends StatelessWidget {
  static const String id = 'cart items';
  const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Your cart items"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ListView.builder(
                itemCount: cartItems.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int i) {
                  return ListTile(
                    title: Text("${cartItems[i].itemName}"),
                    leading: Text("${cartItems[i].category}"),
                    trailing: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Quanity: ${cartItems[i].quantity}"),
                        SizedBox(
                          width: 15,
                        ),
                        Text("Rs. ${cartItems[i].price}"),
                      ],
                    ),
                  );
                },
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Total Price"),
                      ElevatedButton(
                        child: Text("Confirm Order"),
                        onPressed: (){}, 
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
