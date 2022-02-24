import 'package:flutter/material.dart';

class ServedOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      DataTable(
        columns: [
          DataColumn(label: Text('OrderID', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(label: Text('Status', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(label: Text('TimeTaken', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('1')),
            DataCell(Text('Served')),
            DataCell(Text('20 Min')),
          ]),
          DataRow(cells: [
            DataCell(Text('5')),
            DataCell(Text('Served')),
            DataCell(Text('15 Min')),
          ]),
          DataRow(cells: [
            DataCell(Text('10')),
            DataCell(Text('Served')),
            DataCell(Text('1 Hour')),
          ]),
          DataRow(cells: [
            DataCell(Text('15')),
            DataCell(Text('Served')),
            DataCell(Text('....')),
          ]),
        ],
      ),
    ]);
  }
}
