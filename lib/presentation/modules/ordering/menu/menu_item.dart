import 'package:flutter/material.dart';
import 'package:food365/domain/models/modules/ordering/menu_item_model.dart';

class MenuItem extends StatelessWidget {
  final MenuItemModel menuItem;
  MenuItem({required this.menuItem});

  //MenuItemModel get menuItem => widget.menuItem;

  @override
  Widget build(BuildContext context) {
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
              MenuItemImage(
                imagePath: menuItem.imagePath,
              ),
              Container(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MenuItemName(
                      name: menuItem.name,
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
                    MenuItemPrice(
                      price: menuItem.price,
                    ),
                    Card(
                      margin: EdgeInsets.only(right: 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(12),
                      ),
                      child: InkWell(
                        // onTap: addItemToCard,
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
  const MenuItemImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 2.5,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        child: Image.asset(imagePath, fit: BoxFit.cover,)
      ),
    );
  }
}

class MenuItemName extends StatelessWidget {
  final String name;
  const MenuItemName({Key? key, required this.name}) : super(key: key);

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
  const MenuItemDescription({Key? key, required this.description})
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
  const MenuItemPrice({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$ ${price}',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}

class AddItem extends StatelessWidget {
  const AddItem({Key? key}) : super(key: key);

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



  // addItemToCard() {
  //   bool isAddSuccess =
  //       Provider.of<MyCart>(context).addItem(CartItem(food: food, quantity: 1));

  //   if (isAddSuccess) {
  //     final snackBar = SnackBar(
  //       content: Text('${food.name} added to cart'),
  //       action: SnackBarAction(
  //         label: 'view',
  //         onPressed: showCart,
  //       ),
  //       duration: Duration(milliseconds: 1500),
  //     );
  //     Scaffold.of(context).showSnackBar(snackBar);
  //   } else {
  //     final snackBar = SnackBar(
  //       content: Text('You can\'t order from multiple shop at the same time'),
  //       duration: Duration(milliseconds: 1500),
  //     );
  //     Scaffold.of(context).showSnackBar(snackBar);
  //   }
  // }

  // showCart() {
  //   showModalBottomSheet(
  //     shape: roundedRectangle40,
  //     context: context,
  //     builder: (context) => CartBottomSheet(),
  //   );
  // }