import 'package:flutter/material.dart';
import 'package:food365/domain/modules/ordering/category.dart';

//THE DRAWRER ITEMS IN MENU WILL BE POPULATED FROM THE DATABASE
//MAKE SEPARATE CYSTOM DRAWER FOR STAFF OR NOT?

// FOR UNDERSTAND WHO HAS ACCESS TO THE CURRENT INSTANCE OF THE APPLICATION
// THEN POPULATE THE DRAWER ITEM WITH APPROPRIATE TEXT AND TAP

class CustomSideDrawer extends StatelessWidget {
  const CustomSideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: ListView.separated(
          itemCount: categories.length,
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 8.0,
            );
          },
          itemBuilder: (context, index) {
            return Container(
              child: InkWell(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(9),
                          // child: Image.asset(
                          //   imagePath,
                          //   width: width,
                          //   height: height,
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                      ),
                      Positioned(
                        child: Opacity(
                          opacity: 0.65,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              // gradient: gradient,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: (100 / 2) - 4,
                          right: 100 / 4,
                          left: 100 / 4,
                          child: Row(
                            children: <Widget>[
                              Spacer(flex: 1),
                              Text(
                                categories[index].name,
                                textAlign: TextAlign.center,
                                // style: categoryTextStyle,
                              ),
                              Spacer(flex: 1),
                              Container(
                                width: 6,
                                height: 36,
                                decoration: BoxDecoration(
                                  // color: handleColor,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      // child: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      //   child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         ...categories.map(
      //           (category) {
      //             return _DrawerItems(text: category.name, onTap: () {});
      //           },
      //         ),
      //       ]),
      // ),
    );
  }
}

class _DrawerItems extends StatelessWidget {
  final String text;
  final Function onTap;
  const _DrawerItems({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    );
  }
}
