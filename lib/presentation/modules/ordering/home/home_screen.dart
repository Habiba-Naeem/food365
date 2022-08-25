import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food365/domain/models/modules/ordering/cart_item.dart';
import 'package:food365/domain/models/modules/ordering/cart_model.dart';
import 'package:food365/domain/models/modules/ordering/category.dart';
import 'package:food365/domain/models/modules/ordering/menu_item_model.dart';
import 'package:food365/domain/services/menu_service.dart';
import 'package:food365/presentation/modules/ordering/cart/cart_item.dart';
import 'package:food365/presentation/modules/ordering/cart/cart_screen.dart';
import 'package:food365/presentation/modules/ordering/menu/menu_screen.dart';
import 'package:food365/presentation/style.dart';
import 'package:food365/utils/colors.dart';
import 'package:food365/utils/constants.dart';
import 'package:food365/utils/shared/category_card.dart';
import 'package:food365/utils/shared/custom_appbar.dart';
import 'package:food365/utils/shared/custom_bottom_nav_bar.dart';
import 'package:food365/utils/shared/customsidedrawer.dart';
import 'package:food365/utils/shared/loading.dart';

import 'package:food365/domain/services/image_service.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import '../../../../utils/custom_style.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home';

  HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const CustomBottomNavBar(
          id: HomeScreen.id,
        ),
        appBar: AppBar(
          title: Text(
            "Home",
            style: CustomStyle.appbarTitleStyle,
          ),
          backgroundColor: CustomColor.primaryColor,
          leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowAltCircleLeft,
                color: CustomColor.whiteColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(
                  Icons.add_shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.id);
                },
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                shrinkWrap:true,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0, bottom: 24),
                    child: Text('Popular Menu Items', style: headerStyle),
                  ),
                  Expanded(
                    child: StreamBuilder<List<MenuItemModel>>(
                      stream: MenuService().getFamousMenuItems(),
                      initialData: [],
                      builder: (context, snapshot) {
                        if (snapshot.data != null) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return placesWidget(snapshot.data[index], context);
                            },
                          );
                        } else {
                          context.loaderOverlay.show();
                          return const Loading();
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
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
    return Text(
      name,
      style: titleStyle,
      textAlign: TextAlign.start,
    );
  }
}

class CartItemPrice extends StatelessWidget {
  final double price;
  const CartItemPrice({Key key, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$ ${double.parse(price.toStringAsFixed(2))}',
      style: titleStyle,
      textAlign: TextAlign.start,
    );
  }
}

Card placesWidget(MenuItemModel menu, context) {
  var cartmodel = Provider.of<CartModel>(context);
  addItemToCard() {
    bool isAddSuccess = cartmodel.addItem(CartItem(
        menuItemID: menu.itemID,
        menuName: menu.name,
        price: menu.price,
        imageUrl: menu.imagePath,
        quantity: 1));
    print(Provider.of<CartModel>(context, listen: false).allCartItems);
    if (isAddSuccess) {
      final snackBar = SnackBar(
        content: Text('${menu.name} added to cart'),
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
      margin: EdgeInsets.only(bottom: 16),
      child: Container(
        height: 200,
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder(
              future: ImageService().getImage(menuItemId: menu.itemID),
              builder: ((context, snapshot) {
                return snapshot.hasData
                    ? CartItemImage(
                        imagePath: snapshot.data.toString(),
                      )
                    : Loading();
              }),
            ),
            SizedBox(
              width: Sizes.WIDTH_10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CartItemName(
                    name: menu.name,
                  ),
                  CartItemPrice(
                    price: menu.price,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                addItemToCard();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: CustomColor.primaryColor),
                child: Text(
                  "Order Now",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
              ),
            )
          ],
        ),
      ));
}
