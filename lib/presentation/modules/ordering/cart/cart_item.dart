import 'package:flutter/material.dart';
import 'package:food365/domain/models/modules/ordering/cart_item.dart';
import 'package:food365/domain/models/modules/ordering/cart_model.dart';
import 'package:food365/domain/models/modules/ordering/menu_item_model.dart';
import 'package:food365/domain/services/image_service.dart';
import 'package:food365/presentation/modules/admin/edit_product/edit_product_item.dart';
import 'package:food365/utils/constants.dart';
import 'package:food365/utils/shared/loading.dart';
import 'package:provider/provider.dart';

class CartItems extends StatelessWidget {
  final CartItem cartItem;
  const CartItems({Key key, this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartModel = Provider.of<CartModel>(context);

    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Container(
        height: 100,
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FutureBuilder(
                future:
                    ImageService().getImage(menuItemId: cartItem.menuItemID),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? CartItemImage(imagePath: snapshot.data.toString())
                      : Center(
                          child: Loading(),
                        );
                }),
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
                          cartModel.decreaseItem(cartItem);
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
                          cartModel.increaseItem(cartItem);
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
  const CartItemImage({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(6)),
      child: Image.network(
        imagePath.toString(),
        fit: BoxFit.cover,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Loading();
        },
      ),
    );
  }
}

class CartItemName extends StatelessWidget {
  final String name;
  const CartItemName({Key key, this.name}) : super(key: key);

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
  const CartItemPrice({Key key, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 70,
      child: Text(
        '\$ ${double.parse(price.toStringAsFixed(2))}',
        style: titleStyle,
        textAlign: TextAlign.end,
      ),
    );
  }
}
