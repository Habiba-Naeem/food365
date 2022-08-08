import 'package:flutter/material.dart';
import 'package:food365/domain/models/modules/inventory/inventory_item_model.dart';
import 'package:food365/domain/services/inventory_service.dart';

class Inventory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var items = InventoryService().getInventoryItems();
    print(items);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: const Text('Inventory Management'),
        ),
      ),
      body: ListView(children: <Widget>[
        DataTable(
          columns: [
            DataColumn(
                label: Text('Items',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Expiry',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('InStock',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('UnitPrice',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          ],
          rows: [
            DataRow(cells: [
              DataCell(
                StreamBuilder<List<InventoryItemModel>>(
                  stream: InventoryService().getInventoryItems(),
                  builder: (context, snapshot) {
                    return Text('Basil');
                  },
                ),
              ),
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
      ]),
    );
  }
}
