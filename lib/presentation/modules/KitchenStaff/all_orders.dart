
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/modules/ordering/order.dart';

class AllOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<List<OrderModel>>(context);

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
              DataCell( Text(
                e.orderID.toString(),
                maxLines: 2,
              )),
              DataCell(Text(
                e.cookingStatus == false ? "Pending" : "In Progress"
              )),
              const DataCell(const Text('....')),
            ],
          );
        })
      ],
  
    );
  }
}
