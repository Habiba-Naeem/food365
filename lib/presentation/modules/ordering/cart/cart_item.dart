import 'package:flutter/material.dart';
import 'package:food365/domain/models/modules/ordering/cart_item.dart';
import 'package:food365/presentation/utils/constants.dart';

class CartItems extends StatelessWidget {
  final CartItem cartItem;
  const CartItems({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Container(
        height: 100,
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CartItemImage(imagePath: cartItem.menu.imagePath),
            Flexible(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CartItemName(name: cartItem.menu.name),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        customBorder: roundedRectangle4,
                        // onTap: () {
                        //   cart.decreaseItem(cartModel);
                        //   animationController.reset();
                        //   animationController.forward();
                        // },
                        child: Icon(Icons.remove_circle),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16.0, vertical: 2),
                        child: Text('${cartItem.quantity}', style: titleStyle),
                      ),
                      InkWell(
                        customBorder: roundedRectangle4,
                        // onTap: () {
                        //   cart.increaseItem(cartModel);
                        //   animationController.reset();
                        //   animationController.forward();
                        // },
                        child: Icon(Icons.add_circle),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CartItemPrice(price: cartItem.menu.price),
                  InkWell(
                    // onTap: () {
                    //   cart.removeAllInCart(cartModel.food);
                    //   animationController.reset();
                    //   animationController.forward();
                    // },
                    customBorder: roundedRectangle12,
                    child: Icon(Icons.delete_sweep, color: Colors.red),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItemImage extends StatelessWidget {
  final String imagePath;
  const CartItemImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(6)),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
        width: 100,
        height: 100,
      ),
    );
  }
}

class CartItemName extends StatelessWidget {
  final String name;
  const CartItemName({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: Text(
        name,
        style: titleStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class CartItemPrice extends StatefulWidget {
  final double price;
  const CartItemPrice({Key? key, required this.price}) : super(key: key);

  @override
  _CartItemPriceState createState() => _CartItemPriceState();
}

class _CartItemPriceState extends State<CartItemPrice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 70,
      child: Text(
        '\$ ${widget.price}',
        style: titleStyle,
        textAlign: TextAlign.end,
      ),
    );
  }
}
// class CartItem extends StatelessWidget {
//   static const String id = 'cart item';
//   const CartItem({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Your cart items"),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               ListView.builder(
//                 itemCount: cartItems.length,
//                 shrinkWrap: true,
//                 scrollDirection: Axis.vertical,
//                 itemBuilder: (BuildContext context, int i) {
//                   return ListTile(
//                     title: Text("${cartItems[i].itemName}"),
//                     leading: Text("${cartItems[i].category}"),
//                     trailing: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text("Quanity: ${cartItems[i].quantity}"),
//                         SizedBox(
//                           width: 15,
//                         ),
//                         Text("Rs. ${cartItems[i].price}"),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//               Expanded(
//                 child: Align(
//                   alignment: Alignment.bottomRight,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Text("Total Price"),
//                       ElevatedButton(
//                         child: Text("Confirm Order"),
//                         onPressed: (){}, 
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
