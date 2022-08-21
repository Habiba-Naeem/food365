import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food365/domain/models/modules/ordering/category.dart';
import 'package:food365/domain/models/modules/ordering/menu_item_model.dart';
import 'package:food365/domain/services/menu_service.dart';
import 'package:food365/presentation/modules/ordering/cart/cart_item.dart';
import 'package:food365/presentation/modules/ordering/cart/cart_screen.dart';
import 'package:food365/presentation/modules/ordering/menu/menu_screen.dart';
import 'package:food365/presentation/style.dart';
import 'package:food365/utils/colors.dart';
import 'package:food365/utils/shared/category_card.dart';
import 'package:food365/utils/shared/custom_appbar.dart';
import 'package:food365/utils/shared/custom_bottom_nav_bar.dart';
import 'package:food365/utils/shared/customsidedrawer.dart';
import 'package:food365/utils/shared/loading.dart';

import 'package:food365/domain/services/image_service.dart';
import '../../../../utils/custom_style.dart';

//SINCE THE MENU WILL BE CUSTOMIZABLE BY THE ADMIN THEREFORE WE
//NEED TO FETCH MENU ITEMS FROM DATABASE ONCE THE APPLICATION STARTS
//USE THAT DYNAMIC DATA TO FILL THE MENU

class HomeScreen extends StatelessWidget {
  static const String id = 'home';

  HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // drawer: const CustomSideDrawer(),
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
          //headingText: "Home",
          //height: 0,
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

        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Popular Deals",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          height: 0.5,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  StreamBuilder(
                    stream: MenuService().getFamousMenuItems(),
                    builder: (context, snapshot) {
                      print("snapshot data");
                      print(snapshot.data);
                      return
                      snapshot.data!=null?
                      ListView.builder(
                        shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder:(context, index) {

                            return   placesWidget(snapshot.data[index],context);

                          },)
                          : Center(child: Loading());
                    },
                  ),
                //getFamousMenuItems()
                //   placesWidget("Deal1", "Biryani"),
                //   SizedBox(
                //     height: 20,
                //   ),
                //   placesWidget("Deal2", "Karahi"),
                //   SizedBox(
                //     height: 20,
                //   ),
                //   placesWidget("Deal3", "Burger Combo"),
                ],
              ),
            ),
          ),
        ),
        //Padding(padding: const EdgeInsets.only(top: 24.0),

        //   child: Container(
        //     height: 100,
        //     child: ListView.builder(
        //       scrollDirection: Axis.horizontal,
        //       itemCount: categories.length,
        //       itemBuilder: (context, index) {
        //         return CategoryChoiceChip(
        //           category: categories[index],
        //         );
        //       },
        //     ),
        //   ),
        // ),
      ),
    );
  }
}

Row placesWidget(MenuItemModel menu,context) {
  print("menu utem");
  print(menu.imagePath);
  return Row(
    children: [
    FutureBuilder(
      future: ImageService().getImage(menuItemId: menu.itemID),
      builder: ((context, snapshot) => Container(
      height: MediaQuery.of(context).size.width / 2.5,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        child: Image.network(
          snapshot.data.toString(),
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Loading();
          },
        ),
      ),))),

      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${menu.name}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(
              menu.description,
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
      InkWell(
        onTap:() {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuScreen()));
         // Navigator.push(context, MaterialPageRoute(builder: (context)=>HotelPage()));

        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              color: CustomColor.primaryColor),
          child: Text(
            "Order Now",
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ),
      )
    ],
  );
}

// void openNextPage() {
//   // Navigator.push(context, MaterialPageRoute(builder: (context)=>HotelPage()));
// }
