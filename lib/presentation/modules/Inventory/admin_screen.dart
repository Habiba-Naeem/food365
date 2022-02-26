import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  static const String id = "Admin screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inventory"),
      ),
      body: DataTable(
        columns: [
          DataColumn(
              label: Text('Items',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Expiry',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('InStock',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('UnitPrice',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('Basil')),
            DataCell(Text('3/2022')),
            DataCell(Text('0')),
            DataCell(Text('12PKR')),
          ]),
          DataRow(cells: [
            DataCell(Text('Tomatoes')),
            DataCell(Text('3/2022')),
            DataCell(Text('0')),
            DataCell(Text('12PKR')),
          ]),
          DataRow(cells: [
            DataCell(Text('Buns/Bread')),
            DataCell(Text('3/2022')),
            DataCell(Text('0')),
            DataCell(Text('12PKR')),
          ]),
          DataRow(cells: [
            DataCell(Text('Chicken')),
            DataCell(Text('3/2022')),
            DataCell(Text('0')),
            DataCell(Text('12PKR')),
          ]),
        ],
      ),
    );
  }
}
