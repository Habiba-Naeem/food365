import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food365/domain/models/modules/inventory/inventory_item_model.dart';
import 'package:food365/domain/services/inventory_service.dart';
import 'package:food365/presentation/modules/admin/inventory/addInventory.dart';
import 'package:food365/utils/shared/loading.dart';
import 'package:intl/intl.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/custom_style.dart';

class Inventory extends StatelessWidget {
  DateFormat date = new DateFormat("dd/MM/yyyy");
  static const String id = 'home';
  List<DataRow> rows = [];

  List<DataRow> getRows(List<InventoryItemModel> snapshot) {
    List<DataRow> newList = snapshot.map(
      (item) {
        return DataRow(
          cells: [
            DataCell(Text(item.itemName)),
            DataCell(Text(date.format(item.boughtDate))),
            DataCell(
              Text(
               date.format(item.expiryDate),
                style: TextStyle(
                    color: (item.daysTillExpiry <= 3 && !item.expired)
                        ? Colors.orange
                        : item.expired
                            ? Colors.red
                            : Colors.black),
              ),
            ),
            DataCell(
              Text(
                item.quantity.toString(),
              ),
            ),
            DataCell(
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  InventoryService().deleteInventoryItem(
                    inventoryItemID: item.itemID,
                  );
                },
              ),
            ),
          ],
        );
      },
    ).toList();
    return newList;
  }

  // List<InventoryItemModel> inventorylist = snapshot;
  // for (int i = 0; i < inventorylist.length; i++) {
  //   rows.add(
  //     DataRow(
  //       cells: [
  //         DataCell(Text(inventorylist[i].itemName)),
  //         DataCell(Text(inventorylist[i].boughtDate.toString())),
  //         DataCell(Text(
  //           inventorylist[i].expiryDate.toString(),
  //           style: TextStyle(
  //               color: inventorylist[i].expired ? Colors.red : Colors.black),
  //         )),
  //         DataCell(Text(inventorylist[i].quantity.toString())),
  //         DataCell(
  //           IconButton(
  //             icon: Icon(Icons.delete),
  //             onPressed: () {
  //               InventoryService().deleteInventoryItem(
  //                   inventoryItemID: inventorylist[i].itemID);
  //             },
  //           ),
  //         ),
  //       ],
  //     ),

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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
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
        body: SafeArea(
          child: StreamBuilder<List<InventoryItemModel>>(
            stream: InventoryService().getInventoryItems(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? InteractiveViewer(
                    constrained: false,
                    child: DataTable(
                        columnSpacing: 20,
                        columns: const [
                          DataColumn(
                              label: Text('Items',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('Bought',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('Expiry',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('InStock',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('Remove',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                        ],
                        rows: getRows(snapshot.data),
                      ),
                  )
                  : Loading();
            },
          ),
        ));
  }
}
