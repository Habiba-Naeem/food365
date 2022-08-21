import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food365/domain/models/modules/inventory/inventory_item_model.dart';
import 'package:food365/domain/services/inventory_service.dart';
import 'package:food365/presentation/modules/admin/inventory/addInventory.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/custom_style.dart';

class Inventory extends StatefulWidget {
  const Inventory({Key key}) : super(key: key);

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  List<DataRow> rows = [];

  getRows() {
    InventoryService().getInventoryItems().forEach((element) {
      List<InventoryItemModel> inventorylist = element;
      for (int i = 0; i < inventorylist.length; i++) {
        setState(() {
          rows.add(DataRow(cells: [
            DataCell(Text(inventorylist[i].itemName)),
            DataCell(Text(inventorylist[i].boughtDate.toString())),
            DataCell(Text(
              inventorylist[i].expiryDate.toString(),
              style: TextStyle(
                  color: inventorylist[i].expired ? Colors.red : Colors.black),
            )),
            DataCell(Text(inventorylist[i].quantity.toString())),
          ]));
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getRows();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Inventory Management",
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 60,
          child: MaterialButton(
            onPressed: () async {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return AddInventoryScreen();
              }));
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  color: CustomColor.primaryColor),
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Add Inventory',
                style: CustomStyle.appbarTitleStyle,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView(shrinkWrap: true, children: <Widget>[
          DataTable(
            columnSpacing: 20,
            columns: [
              DataColumn(
                  label: Text('Items',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Bought',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Expiry',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('InStock',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
            ],
            rows: rows,
          ),
        ]),
      ),
    );
  }
}
