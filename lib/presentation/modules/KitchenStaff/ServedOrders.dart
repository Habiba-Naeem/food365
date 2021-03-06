import 'package:flutter/material.dart';
import 'package:food365/presentation/modules/KitchenStaff/items_modal.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/modules/ordering/order.dart';

class ServedOrders extends StatelessWidget {
  showServedItems(context, orderID, orderItems) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: ItemsModal(orderItems: orderItems, orderID: orderID),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<List<OrderModel>>(context);
    return ListView(children: <Widget>[
      DataTable(
        columns: [
          DataColumn(
              label: Text('OrderID',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Served Items',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('TimeTaken',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        ],
        rows: [
          ...orders.map((e) {
            return 
            DataRow(
            cells: [
              DataCell(
                Container(
                  width: 100,
                  child: Text(
                    e.orderID.toString(),
                  ),
                ),
              ),
              DataCell(
                Text(e.servedItems.toString())
              ),
              DataCell(
                  ElevatedButton(
                    onPressed: () {
                      print(e.items.first.cookingStatus);
                      showServedItems(context, e.orderID, e.items);
                    },
                    child: Text("View"),
                  ),
                )
            ],
          );
          })
        ],
      ),
    ]);
  }
}
