import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/modules/ordering/order.dart';

class AllOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<List<OrderModel>>(context);
    showAllItems(context) {
      showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
          controller: ModalScrollController.of(context),
          child: Container(),
        ),
      );
    }

    

    return DataTable(
      columns: [
        const DataColumn(
            label: Text('OrderID',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        const DataColumn(
            label: Text('Status',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        const DataColumn(
            label: const Text('TimeLeft',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
      ],
      rows: [
        ...orders.map((e) {
          return DataRow(
            cells: [
              DataCell(
                Container(
                  width: 100,
                  child: Text(
                    e.orderID.toString(),
                  ),
                ),
              ),
              DataCell(Text(e.serviceStatus == true
                  ? "Served"
                  : e.readyStatus == true
                      ? "Ready"
                      : e.cookingStatus == true
                          ? "In progress"
                          : "Pending")),
              const DataCell(const Text('....')),
              DataCell(
                ElevatedButton(
                  onPressed: () {},
                  child: Text("View"),
                ),
              )
            ],
          );
        })
      ],
    );
  }
}
