import 'package:flutter/material.dart';
import 'package:food365/domain/services/image_service.dart';
import 'package:food365/domain/services/menu_service.dart';
import 'package:food365/utils/shared/loading.dart';
import 'package:provider/provider.dart';

import 'package:food365/domain/models/modules/ordering/cart_item.dart';
import 'package:food365/domain/models/modules/ordering/cart_model.dart';
import 'package:food365/domain/models/modules/ordering/menu_item_model.dart';

import 'editing_screen.dart';

class EditProductItem extends StatelessWidget {
  final MenuItemModel menuItem;
  EditProductItem({this.menuItem});

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
              FutureBuilder(
                  future: ImageService().getImage(menuItemId: menuItem.itemID),
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? MenuItemImage(
                            imagePath: snapshot.data.toString(),
                          )
                        : Center(child: Loading());
                  }),
              Container(
                padding: const EdgeInsets.only(left: 8, right: 8),
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
                    MenuItemPrice(
                      price: menuItem.price,
                    ),
                    Card(
                      margin: EdgeInsets.only(right: 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(12),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return Provider<MenuItemModel>.value(
                              value: menuItem,
                              child: EditItem(),
                            );
                          }));
                        },
                        splashColor: Colors.white70,
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(12),
                        ),
                        child: Icon(Icons.edit),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.only(right: 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(12),
                      ),
                      child: InkWell(
                        onTap: () async {
                          await MenuService().deleteMenuItem(
                              menuItemID: menuItem.itemID.toString());
                        },
                        splashColor: Colors.white70,
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(12),
                        ),
                        child: Icon(Icons.delete),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.only(right: 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(12),
                      ),
                      child: InkWell(
                        onTap: () async {
                          menuItem.famous = !menuItem.famous;
                          await MenuService().togglefamousMenuItem(
                            menuItem: menuItem,
                            menuItemID: menuItem.itemID,
                          );
                        },
                        splashColor: Colors.white70,
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(12),
                        ),
                        child: menuItem.famous
                            ? Icon(Icons.star)
                            : Icon(Icons.star_border_outlined),
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
  const MenuItemImage({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 2.5,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        child: Image.network(
          imagePath,
        // child: Image.asset(
        //   imagePath.toString(),
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Loading();
          },
        ),

        // child: Image.asset(
        //   imagePath,
        //   fit: BoxFit.cover,
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
  const MenuItemDescription({Key key, this.description}) : super(key: key);

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
  const MenuItemPrice({Key key, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'PKR ${price}',
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
