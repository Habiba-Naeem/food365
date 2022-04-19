import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/modules/ordering/order.dart';

class ServedOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<List<OrderModel>>(context);
    return ListView(children: <Widget>[
      DataTable(
        columns: [
          DataColumn(
              label: Text('OrderID',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          // DataColumn(
          //     label: Text('Status',
          //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
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
                //DataCell(Text(e.serviceStatus == true ? "Served" : "")),
                const DataCell(const Text('....')),
              ],
            );
          })
        ],
      ),
    ]);
  }
}
