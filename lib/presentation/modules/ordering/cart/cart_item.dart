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
            //ADD PICTURES IN THIS COMMENTED PART

            ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                child: Image.asset(
                  cartItem.menu.imagePath,
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                )),
            Flexible(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 45,
                    child: Text(
                      cartItem.menu.name,
                      style: titleStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
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
                        child:
                            Text('${cartItems[2].quantity}', style: titleStyle),
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
                  Container(
                    height: 45,
                    width: 70,
                    child: Text(
                      '\$ ${cartItem.menu.price}',
                      style: titleStyle,
                      textAlign: TextAlign.end,
                    ),
                  ),
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
