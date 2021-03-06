import 'package:flutter/material.dart';
import 'package:food365/domain/models/modules/ordering/category.dart';
import 'package:food365/domain/services/menu_service.dart';
import 'package:food365/presentation/modules/ordering/cart/cart_item.dart';
import 'package:food365/presentation/modules/ordering/cart/cart_screen.dart';
import 'package:food365/presentation/style.dart';
import 'package:food365/utils/shared/category_card.dart';
import 'package:food365/utils/shared/custom_appbar.dart';
import 'package:food365/utils/shared/custom_bottom_nav_bar.dart';
import 'package:food365/utils/shared/customsidedrawer.dart';

//SINCE THE MENU WILL BE CUSTOMIZABLE BY THE ADMIN THEREFORE WE
//NEED TO FETCH MENU ITEMS FROM DATABASE ONCE THE APPLICATION STARTS
//USE THAT DYNAMIC DATA TO FILL THE MENU

class HomeScreen extends StatelessWidget {
  static const String id = 'home';

  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const CustomSideDrawer(),
        bottomNavigationBar: const CustomBottomNavBar(
          id: HomeScreen.id,
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        elevation: 0,
          //headingText: "Home",
      //height: 0,
      leading: IconButton(
          onPressed: () {
            //do your operation while chaning value
          },
          icon: Icon(
            Icons.arrow_back,
            size: 27,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //do your operation while chaning value
            },
            icon: Icon(
              Icons.search,
              size: 27,
              color: Colors.grey,
            ),
          )
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Today's Special",
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(25)), color: tealBtn),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_shopping_cart,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  Text(
                                    " CART",
                                    style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)), color: tealBtn.withOpacity(0.7)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Find out what's cooking today!",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 20),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.55,
                        height: 350,
                        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)), color: tealDark, boxShadow: [
                          BoxShadow(spreadRadius: 0, offset: Offset(0, 10), blurRadius: 0, color: tealDark.withOpacity(0.4))
                        ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(image: DecorationImage(image: AssetImage(""))),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "White Karahi",
                              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 17,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 17,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 17,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 17,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 17,
                                ),
                                Text(
                                  " 250 Ratings",
                                  style: TextStyle(color: Colors.white, fontSize: 10),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Lorem ipsum is a dummy text used for printing",
                              style: TextStyle(color: Colors.white, fontSize: 13),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: 165,
                            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)), color: tealLight, boxShadow: [
                              BoxShadow(spreadRadius: 0, offset: Offset(0, 10), blurRadius: 0, color: tealLight.withOpacity(0.4))
                            ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage(""))),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Reshmi Kabab",
                                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 14,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 14,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 14,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 14,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 14,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.35,
                                height: 165,
                                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)), color: tealDark, boxShadow: [
                                  BoxShadow(spreadRadius: 0, offset: Offset(0, 10), blurRadius: 0, color: tealDark.withOpacity(0.4))
                                ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(image: DecorationImage(image: AssetImage(""))),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "BBQ Platter",
                                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.white,
                                          size: 14,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.white,
                                          size: 14,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.white,
                                          size: 14,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.white,
                                          size: 14,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.white,
                                          size: 14,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Popular Deals",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
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
                placesWidget("Deal1", "Biryani"),
                SizedBox(
                  height: 20,
                ),
                placesWidget("Deal2", "Karahi"),
                SizedBox(
                  height: 20,
                ),
                placesWidget("Deal3", "Burger Combo"),
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
Row placesWidget(String img, String name) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/$img.png"))),
          //decoration: BoxDecoration(image: DecorationImage(image: AssetImage("asset/images/$img.png"))),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$name",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                ],
              ),
              Text(
                "Lorem ipsum sits dolar amet is for publishing",
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
        InkWell(
          onTap: openNextPage,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40)), color: tealBtn),
            child: Text(
              "Order Now",
              style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700),
            ),
          ),
        )
      ],
    );
  }

  void openNextPage() {
    // Navigator.push(context, MaterialPageRoute(builder: (context)=>HotelPage()));
  }


