import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food365/domain/services/auth_service.dart';
import 'package:food365/domain/services/inventory_service.dart';
import '../../../utils/colors.dart';
import '../../../utils/custom_style.dart';
import 'add_product/addProduct.dart';
import 'edit_product/editproduct_screen.dart';
import 'inventory/manage_inventory.dart';

class AdminScreen extends StatefulWidget {
  static const String id = "Admin screen";
  const AdminScreen({Key key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  bool loader=false;
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          "Admin Dashboard",
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
                FontAwesomeIcons.signOutAlt,
                color: Colors.white,
              ),
              onPressed: () {
                AuthService().signOut();
              },
            ),
          ),
        ],
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            loader?SpinKitCircle(color: Colors.red,):serviceCard(context, "Manage Inventory"),
            SizedBox(height: 10,),
            serviceCard(context, "View All Products"),
            SizedBox(height: 10,),
            serviceCard(context, "Add New Product"),

      ])),
    );
  }

  void _addProduct(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AddProductScreen()));
  }

  Widget serviceCard(context, String name) {
    //bool isActive = active == item["key"];
    return GestureDetector(
      onTap: () {
        if(name=="Manage Inventory"){
          _viewInventory(context);

        }
        else if(name=="View All Products"){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => EditProductScreen()));

        }
        else{


          _addProduct(context);
        }

        // setActive(item["key"]);
        // Future.delayed(Duration(milliseconds: 350), () {
        //   nextPage();
        // });
      },
      child: AnimatedContainer(
        height: 130,
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: CustomColor.primaryColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(name, style: CustomStyle.appbarTitleStyle),
            )
          ],
        ),
      ),
    );
  }
  void _viewInventory(BuildContext context) async {
    setState(() {
      loader=true;

    });
    
setState(() {
  loader=false;

});
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Inventory()));
  }
}
