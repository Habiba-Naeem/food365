import 'package:flutter/material.dart';
import 'package:food365/domain/modules/ordering/category.dart';
import 'package:food365/domain/modules/ordering/menu_item_model.dart';
import 'package:food365/domain/services/menu_service.dart';
import 'package:food365/presentation/modules/ordering/cart/cart_items.dart';
import 'package:food365/presentation/modules/ordering/cart/cart_screen.dart';
import 'package:food365/presentation/shared/custom_bottom_nav_bar.dart';
import 'package:food365/presentation/shared/customsidedrawer.dart';

//SINCE THE MENU WILL BE CUSTOMIZABLE BY THE ADMIN THEREFORE WE
//NEED TO FETCH MENU ITEMS FROM DATABASE ONCE THE APPLICATION STARTS
//USE THAT DYNAMIC DATA TO FILL THE MENU
class HomeScreen extends StatelessWidget {
  static const int TAB_NO = 0;

  HomeScreen({Key key}) : super(key: key);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: Sizes.MARGIN_16,
            vertical: Sizes.MARGIN_8,
          ),
          child: ListView(
            children: <Widget>[
              FoodyBiteSearchInputField(
                ImagePath.searchIcon,
                controller: controller,
                textFormFieldStyle:
                    Styles.customNormalTextStyle(color: AppColors.accentText),
                hintText: StringConst.HINT_TEXT_HOME_SEARCH_BAR,
                hintTextStyle:
                    Styles.customNormalTextStyle(color: AppColors.accentText),
                suffixIconImagePath: ImagePath.settingsIcon,
                borderWidth: 0.0,
                onTapOfLeadingIcon: () => AppRouter.navigator.pushNamed(
                  AppRouter.searchResultsScreen,
                  arguments: SearchValue(
                    controller.text,
                  ),
                ),
                onTapOfSuffixIcon: () =>
                    AppRouter.navigator.pushNamed(AppRouter.filterScreen),
                borderStyle: BorderStyle.solid,
              ),
              SizedBox(height: 16.0),
              HeadingRow(
                title: StringConst.TRENDING_RESTAURANTS,
                number: StringConst.SEE_ALL_45,
                onTapOfNumber: () => AppRouter.navigator
                    .pushNamed(AppRouter.trendingRestaurantsScreen),
              ),
              
              SizedBox(height: 16.0),
              HeadingRow(
                title: StringConst.CATEGORY,
                number: StringConst.SEE_ALL_9,
                onTapOfNumber: () =>
                    AppRouter.navigator.pushNamed(AppRouter.categoriesScreen),
              ),
              SizedBox(height: 16.0),
              Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryImagePaths.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 8.0),
                      child: FoodyBiteCategoryCard(
                        imagePath: categoryImagePaths[index],
                        gradient: gradients[index],
                        category: category[index],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16.0),
              HeadingRow(
                title: StringConst.FRIENDS,
                number: StringConst.SEE_ALL_56,
                onTapOfNumber: () => AppRouter.navigator.pushNamed(
                  AppRouter.findFriendsScreen,
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: createUserProfilePhotos(numberOfProfilePhotos: 6),
              ),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

 

   
}

// class HomeScreen extends StatelessWidget {
//   static const String id = 'home';
 
//   HomeScreen({
//     Key? key,
   
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         drawer: CustomSideDrawer(),
//         bottomNavigationBar: CustomBottomNavBar(),
//         appBar: AppBar(
//           title: Text("Menu"),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.shopping_cart_sharp),
//               onPressed: () {
//                 Navigator.of(context).pushNamed(CartScreen.id);
//               },
//             )
//           ],
        
//         ),
//       ),
//     );


// class MenuItem extends StatefulWidget {
//   List<MenuItem> menuItems;
//   MenuItem({Key? key, required this.menuItems}) : super(key: key);

//   @override
//   _MenuItemState createState() => _MenuItemState();
// }

// class _MenuItemState extends State<MenuItem> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       scrollDirection: Axis.vertical,
//       itemCount: menuItems.length,
//       itemBuilder: (BuildContext context, int i) {
//         return Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Text(menuItems[i].name),
//             SizedBox(
//               height: 20,
//             ),

//             //CHECK ALIGNMENT IF IT IS WORKING OR NOT
//             const Align(
//               alignment: Alignment.centerLeft,
//               child: Text("Rs 50"),
//             ),
//             Align(
//               alignment: Alignment.centerLeft,
//               child: IconButton(
//                 onPressed: () {},
//                 icon: const Icon(Icons.add),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
