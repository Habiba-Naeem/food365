import 'package:flutter/material.dart';
import 'package:food365/domain/modules/ordering/menu_item.dart';

class MenuItem extends StatefulWidget {
  // final MenuItem menuItem;
  MenuItem();

  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem>
    with SingleTickerProviderStateMixin {
  //MenuItem get menuItem => widget.menuItem;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(12),
        ),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // buildImage(),
                Container(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        menuItems[2].name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        menuItems[2].description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                //buildRating(),
                //buildPriceInfo(),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '\$ ${menuItems[2].price}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Card(
                        margin: EdgeInsets.only(right: 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(12),
                        ),
                        //color: mainColor,
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
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  //color: mainColor,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(12)),
                ),
                child: Text(menuItems[2].name),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Widget buildImage() {
  //   return Container(
  //     height: MediaQuery.of(context).size.width / 2.5,
  //     child: ClipRRect(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
  //       child: Image.network(
  //         '$BASE_URL/uploads/${food.images[0]}',
  //         fit: BoxFit.cover,
  //         loadingBuilder: (context, Widget child, ImageChunkEvent progress) {
  //           if (progress == null) return child;
  //           return Center(
  //             child: Padding(
  //               padding: EdgeInsets.all(32),
  //               child: CircularProgressIndicator(
  //                   value: progress.expectedTotalBytes != null
  //                       ? progress.cumulativeBytesLoaded /
  //                           progress.expectedTotalBytes
  //                       : null),
  //             ),
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }

  // Widget buildTitle() {
  //   return Container(
  //     padding: const EdgeInsets.only(left: 8, right: 8),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         Text(
  //           food.name,
  //           maxLines: 2,
  //           overflow: TextOverflow.ellipsis,
  //           style: titleStyle,
  //         ),
  //         Text(
  //           food.description,
  //           maxLines: 2,
  //           overflow: TextOverflow.ellipsis,
  //           style: infoStyle,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget buildRating() {
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 4, right: 8),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: <Widget>[
  //         RatingBar(
  //           initialRating: 5.0,
  //           direction: Axis.horizontal,
  //           itemCount: 5,
  //           itemSize: 14,
  //           unratedColor: Colors.black,
  //           itemPadding: EdgeInsets.only(right: 4.0),
  //           ignoreGestures: true,
  //           itemBuilder: (context, index) => Icon(Icons.star, color: mainColor),
  //           onRatingUpdate: (rating) {},
  //         ),
  //         Text('(${food.rating})'),
  //       ],
  //     ),
  //   );
  // }

  // Widget buildPriceInfo() {
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: <Widget>[
  //         Text(
  //           '\$ ${food.price}',
  //           style: titleStyle,
  //         ),
  //         Card(
  //           margin: EdgeInsets.only(right: 0),
  //           shape: roundedRectangle4,
  //           color: mainColor,
  //           child: InkWell(
  //             onTap: addItemToCard,
  //             splashColor: Colors.white70,
  //             customBorder: roundedRectangle4,
  //             child: Icon(Icons.add),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

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
}
