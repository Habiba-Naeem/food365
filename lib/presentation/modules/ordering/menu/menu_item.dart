import 'package:flutter/material.dart';
import 'package:food365/domain/services/image_service.dart';
import 'package:food365/utils/shared/loading.dart';
import 'package:provider/provider.dart';

import 'package:food365/domain/models/modules/ordering/cart_item.dart';
import 'package:food365/domain/models/modules/ordering/cart_model.dart';
import 'package:food365/domain/models/modules/ordering/menu_item_model.dart';

class MenuItem extends StatelessWidget {
  final MenuItemModel menuItem;
  MenuItem({ this.menuItem});

  //MenuItemModel get menuItem => widget.menuItem;

  @override
  Widget build(BuildContext context) {
   var cartmodel= Provider.of<CartModel>(context);
    addItemToCard() {
      print("menuItem.imagePath");
      print(menuItem.imagePath);
      bool isAddSuccess = cartmodel
          .addItem(CartItem(
              menuItemID: menuItem.itemID,
              menuName: menuItem.name,
              price: menuItem.price,
              imageUrl: menuItem.imagePath,
              quantity: 1));
      print(Provider.of<CartModel>(context, listen: false).allCartItems);
      if (isAddSuccess) {
        final snackBar = SnackBar(
          content: Text('${menuItem.name} added to cart'),
          action: SnackBarAction(
            label: 'view',
            onPressed: () {},
          ),
          duration: Duration(milliseconds: 1500),
        );
        Scaffold.of(context).showSnackBar(snackBar);
      } else {
        const snackBar = const SnackBar(
          content: Text('You can\'t order from multiple shop at the same time'),
          duration: Duration(milliseconds: 1500),
        );
        Scaffold.of(context).showSnackBar(snackBar);
      }
    }

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(12),
      ),
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FutureBuilder(
                  future: ImageService().getImage(menuItemId: menuItem.itemID),
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? MenuItemImage(
                            imagePath: snapshot.data.toString(),
                          )
                        : Center(child: Loading());
                  }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MenuItemName(
                      name: menuItem.name,
                      time: menuItem.time,
                    ),
                    MenuItemDescription(
                      description: menuItem.description,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: MenuItemPrice(
                        price: menuItem.price,
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.only(right: 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(12),
                      ),
                      child: InkWell(
                        onTap: addItemToCard,
                        splashColor: Colors.white70,
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(12),
                        ),
                        child: Icon(Icons.add),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class MenuItemImage extends StatelessWidget {
  final String imagePath;
  const MenuItemImage({Key key,  this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 2.5,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          // loadingBuilder: (BuildContext context, Widget child,
          //     ImageChunkEvent loadingProgress) {
          //   if (loadingProgress == null) {
          //     return child;
          //   }
          //   return Loading();
          // },
        ),
        // child: Image.network(
        //   imagePath.toString(),
        //   fit: BoxFit.cover,
        //   loadingBuilder: (BuildContext context, Widget child,
        //       ImageChunkEvent? loadingProgress) {
        //     if (loadingProgress == null) {
        //       return child;
        //     }
        //     return Loading();
        //   },
        // ),
      ),
    );
  }
}

class MenuItemName extends StatelessWidget {
  final String name;
  final Duration time;
  const MenuItemName({
    Key key,
     this.name,
     this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}

class MenuItemDescription extends StatelessWidget {
  final String description;
  const MenuItemDescription({Key key,  this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 12, color: Colors.black54),
    );
  }
}

class MenuItemPrice extends StatelessWidget {
  final double price;
  const MenuItemPrice({Key key,  this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$ ${price}',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}

class AddItem extends StatelessWidget {
  const AddItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white70,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(12),
      ),
      child: Icon(Icons.add),
    );
  }
}
