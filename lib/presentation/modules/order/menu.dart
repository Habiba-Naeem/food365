import 'package:flutter/material.dart';
import 'package:food365/presentation/shared/customsidedrawer.dart';

//SINCE THE MENU WILL BE CUSTOMIZABLE BY THE ADMIN THEREFORE WE
//NEED TO FETCH MENU ITEMS FROM DATABASE ONCE THE APPLICATION STARTS
//USE THAT DYNAMIC DATA TO FILL THE MENU

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomSideDrawer(),
        appBar: AppBar(
          title: Text("Menu"),
          actions: [
            IconButton(icon: Icon(Icons.shopping_cart_sharp),
            onPressed: (){},
            )
          ],
        ),
        body: Column(
          children: [
            Text(
              "Appetizers",
              style: TextStyle(fontSize: 15),
            ),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 3,
              itemBuilder: (BuildContext context, int i) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("Crackers"),
                    SizedBox(height: 20,),

                    //CHECK ALIGNMENT IF IT IS WORKING OR NOT
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Rs 50"),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                      ),
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
