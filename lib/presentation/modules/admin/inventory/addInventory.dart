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
import 'manage_inventory.dart';

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

  String name = "";
  int quantity = 0;
  DateTime boughtdate;
  DateTime expirydate;
  bool expired = false;
  bool loading = false;
  final TextEditingController _boughtdate = TextEditingController();
  final TextEditingController _expirydate = TextEditingController();

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
            child: Text(
              "Name",
              style: CustomStyle.headingStyle,
            ),
          ),
          TextFormField(
            cursorColor: const Color.fromARGB(255, 255, 128, 128),
            onChanged: (val) => setState(
              () => name = val,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter name';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "Name",
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide.none),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Quantity",
              style: CustomStyle.headingStyle,
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            cursorColor: Colors.orange[200],
            onChanged: (val) => setState(() => quantity = int.parse(val)),
            decoration: InputDecoration(
              labelText: "Quantity",
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
            child: Text(
              "Bought Date",
              style: CustomStyle.headingStyle,
            ),
          ),
          InkWell(
            onTap: () {
              _selectDate(context).then((value) {
                setState(() {
                  boughtdate = value;
                  _boughtdate.text = value.toString();
                });
              });
            },
            child: TextFormField(
              cursorColor: Colors.orange[200],
              enabled: false,
              keyboardType: TextInputType.number,
              controller: _boughtdate,
              decoration: InputDecoration(
                labelText: "Bought Date",
                filled: true,
                prefixIcon:
                    Icon(Icons.date_range, color: Colors.orange[200], size: 20),
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
            child: Text(
              "Expiry Date",
              style: CustomStyle.headingStyle,
            ),
          ),
          InkWell(
            onTap: () {
              _selectDate(context).then((value) {
                setState(() {
                  expirydate = value;
                  _expirydate.text = value.toString();
                });
              });
            },
            child: TextFormField(
              cursorColor: Colors.orange[200],
              enabled: false,
              keyboardType: TextInputType.number,
              controller: _expirydate,
              decoration: InputDecoration(
                labelText: "Expiry Date",
                filled: true,
                prefixIcon:
                    Icon(Icons.date_range, color: Colors.orange[200], size: 20),
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
          SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: () async {
              if (!_formKey.currentState.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please enter all fields')),
                );
              } else {
                setState(() => loading = true);
                InventoryService().postInventoryItem(
                    itemName: name,
                    boughtDate: boughtdate,
                    expiryDate: expirydate,
                    quantity: quantity);

                Navigator.pop(context, Inventory.id);
              }
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  color: CustomColor.primaryColor),
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
