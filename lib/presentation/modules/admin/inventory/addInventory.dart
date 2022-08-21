import 'dart:io';

import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food365/domain/models/modules/ordering/category.dart';
import 'package:food365/domain/services/inventory_service.dart';
import 'package:food365/domain/services/menu_service.dart';
import 'package:food365/utils/shared/loading.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/custom_style.dart';

class AddInventoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(


        appBar: AppBar(
          title: Text(
            "Add Inventory",
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

        ),
        body: const Padding(
          padding: const EdgeInsets.all(8.0),
          child: const SingleChildScrollView(child: const AddInventoryForm()),
        ),
      ),
    );
  }
}

class AddInventoryForm extends StatefulWidget {
  const AddInventoryForm({Key key}) : super(key: key);

  @override
  State<AddInventoryForm> createState() => _AddInventoryFormState();
}

class _AddInventoryFormState extends State<AddInventoryForm> {
  final _formKey = GlobalKey<FormState>();
  // File _image;
  // final ImagePicker picker = ImagePicker();
  // String imagePath = '';
  // String category = '';
  // String name = '';
  // String description = '';
  // double price = 0;
  // Duration time = Duration(minutes: 0);
  String Name="";
  int Quantity=0;
  DateTime Boughtdate;
  DateTime Expirydate;
  bool expired=false;
  bool loading = false;
  TextEditingController _boughtdate=new TextEditingController();
  TextEditingController _expirydate=new TextEditingController();
  Future<DateTime> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
   return picked;
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 32,
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Name",style: CustomStyle.headingStyle,),
          ),
          TextFormField(
            cursorColor: const Color.fromARGB(255, 255, 128, 128),
            onChanged: (val) => setState(() => Name = val),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter name';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "Name",
              //fillColor: const Color.fromARGB(255, 127, 228, 218),
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide.none),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Quantity",style: CustomStyle.headingStyle,),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            cursorColor: Colors.orange[200],
            onChanged: (val) => setState(() => Quantity = int.parse(val)),
            decoration: InputDecoration(
              labelText: "Quantity",
              //fillColor: const Color.fromARGB(255, 127, 228, 218),
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide.none),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter quantity';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Bought Date",style: CustomStyle.headingStyle,),
          ),
          InkWell(
            onTap: () {
              _selectDate(context).then((value) {
setState(() {
  Boughtdate=value;
  _boughtdate.text=value.toString();

});
              });
            },
            child: TextFormField(
              cursorColor: Colors.orange[200],
              enabled: false,
              keyboardType: TextInputType.number,
             controller:  _boughtdate,
              decoration: InputDecoration(
                labelText: "Bought Date",
                filled: true,
                prefixIcon: Icon(Icons.currency_rupee,
                    color: Colors.orange[200], size: 20),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select bought date';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Expiry Date",style: CustomStyle.headingStyle,),
          ),

          InkWell(
            onTap: () {
              _selectDate(context).then((value) {
                setState(() {
                  Expirydate=value;
                  _expirydate.text=value.toString();

                });
              });
            },
            child: TextFormField(
              cursorColor: Colors.orange[200],
              enabled: false,
              keyboardType: TextInputType.number,
              controller:  _expirydate,
              decoration: InputDecoration(
                labelText: "Expiry Date",
                filled: true,
                prefixIcon: Icon(Icons.currency_rupee,
                    color: Colors.orange[200], size: 20),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select expiry date';
                }
                return null;
              },
            ),
          ),

SizedBox(height: 10,),
          MaterialButton(
            onPressed: () async {

              if (!_formKey.currentState.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.

              }

              else{

                 setState(() => loading = true);
                InventoryService().postInventoryItem(
                  itemName: Name,
                  boughtDate: Boughtdate,
                  expiryDate: Expirydate,
                  quantity: Quantity
                );
                 // MenuService().postMenuItem(
                //     categoryID: category,
                //     description: description,
                //     imagePath: imagePath,
                //     name: name,
                //     price: price,
                //     time: time,
                //     image: _image);
                Navigator.pop(context);

              }
               },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),

                color: CustomColor.primaryColor
              ),
              padding: const EdgeInsets.all(12.0),
              child: loading
                  ? Loading()
                  : Text(
                      'Add',
                      style: CustomStyle.appbarTitleStyle,
                    ),
            ),
          )
        ],
      ),
    );
  }
}

// class AddProduct extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Center(
//           child: const Text('Add Product'),
//         ),
//       ),
//       body: ListView(
//         children: <Widget>[
//           Container(
//             height: 250,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Colors.teal.shade100,
//                   Colors.teal.shade50
//                 ],
//                 begin: Alignment.centerLeft,
//                 end: Alignment.centerRight,
//                 stops: [
//                   0.5,
//                   0.9
//                 ],
//               ),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: <Widget>[
//                     CircleAvatar(
//                       backgroundColor: Colors.white,
//                       minRadius: 75.0,
//                       child: CircleAvatar(
//                         radius: 0.0,
//                         backgroundImage: NetworkImage(''),
//                       ),
//                     ),
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(5.0), //or 15.0
//                       child: Container(
//                         height: 30.0,
//                         width: 30.0,
//                         color: Colors.cyan[800],
//                         child: Icon(Icons.edit, color: Colors.white, size: 25.0),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   'Product Name',
//                   style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Text(
//                   'Category',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 22,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                   child: Container(
//                     color: Colors.teal,
//                     child: ListTile(
//                       title: Text(
//                         '0PKR',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                           color: Colors.white,
//                         ),
//                       ),
//                       subtitle: Text(
//                         'Price',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.white70,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             child: Column(
//               children: <Widget>[
//                 ListTile(
//                   title: Text(
//                     'Description',
//                     style: TextStyle(
//                       color: Colors.teal,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   subtitle: Text(
//                     'Lorem Ipsum hdhshdjahdau haeguaheiuarh bdhdsahs',
//                     style: TextStyle(
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//                 Divider(),
//                 ListTile(
//                   title: Text(
//                     'Category',
//                     style: TextStyle(
//                       color: Colors.teal,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   subtitle: Text(
//                     'Foods',
//                     style: TextStyle(
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(25),
//                   child: FlatButton(
//                     child: Text(
//                       'Add Product',
//                       style: TextStyle(fontSize: 20.0),
//                     ),
//                     color: Colors.blueAccent,
//                     textColor: Colors.white,
//                     onPressed: () {},
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
