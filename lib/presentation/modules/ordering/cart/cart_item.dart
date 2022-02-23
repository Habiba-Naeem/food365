import 'package:flutter/material.dart';
import 'package:food365/domain/models/modules/ordering/cart_item.dart';
import 'package:food365/domain/models/modules/ordering/cart_model.dart';
import 'package:food365/domain/models/modules/ordering/menu_item_model.dart';
import 'package:food365/presentation/utils/constants.dart';
import 'package:provider/provider.dart';

class CartItems extends StatelessWidget {
  final CartItem cartItem;
  const CartItems({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuItems = Provider.of<List<MenuItemModel>>(context);
    print("my menuitems in cart");
    print(menuItems);
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Container(
        height: 100,
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ...menuItems.map((menuItem){
              if(menuItem.itemID == cartItem.menuItemID){
                return CartItemImage(imagePath: menuItem.imagePath);
              }
              return Container();
            }),
            //CartItemImage(imagePath: imagePath),
            Flexible(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CartItemName(name: cartItem.menuName),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        customBorder: roundedRectangle4,
                        onTap: () {
                          Provider.of<CartModel>(context, listen: false)
                              .decreaseItem(cartItem);
                        },
                        child: Icon(Icons.remove_circle),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16.0, vertical: 2),
                        child: Text('${cartItem.quantity}', style: titleStyle),
                      ),
                      InkWell(
                        customBorder: roundedRectangle4,
                        onTap: () {
                          Provider.of<CartModel>(context, listen: false)
                              .increaseItem(cartItem);
                        },
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
                  CartItemPrice(price: cartItem.price * cartItem.quantity),
                  InkWell(
                    onTap: () {
                      Provider.of<CartModel>(context, listen: false)
                          .removeAllInCart(cartItem);
                    },
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

class CartItemPrice extends StatelessWidget {
  final double price;
  const CartItemPrice({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 70,
      child: Text(
        '\$ ${price}',
        style: titleStyle,
        textAlign: TextAlign.end,
      ),
    );
  }
}
