import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food365/domain/models/modules/ordering/menu_item_model.dart';
import 'package:food365/domain/models/modules/ordering/order.dart';
import 'package:food365/domain/services/order_service.dart';
import 'package:food365/presentation/shared/loading.dart';
import 'package:provider/provider.dart';

class CurrentOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<OrderModel>>(
        stream: OrderService().getAllOrders().asStream(),
        key: Key("${Random().nextDouble()}"),
        builder: (context, snapshot) {
          final orders = Provider.of<List<OrderModel>>(context);
          return snapshot.hasData
              ? Container(child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                  return DataTable(
                    key: Key("${Random().nextDouble()}"),
                    columns: [
                      const DataColumn(
                          label: Text('OrderID',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                      const DataColumn(
                          label: Text('Status',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                      const DataColumn(
                          label: const Text('TimeLeft',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                    ],
                    rows: [
                      //key: Key("${Random().nextDouble()}"),
                      ...orders.map(
                        (e) => DataRow(cells: [
                          DataCell(Text(e.items.toString())),
                          DataCell(DropdownExample()),
                          const DataCell(const Text('....')),
                        ]),
                      )
                    ],
                    // rows: [
                    //   DataRow(cells: [
                    //     const DataCell(const Text('1')),
                    //     DataCell(DropdownExample()),
                    //     const DataCell(const Text('....')),
                    //   ]),
                    //   DataRow(cells: [
                    //     const DataCell(Text('5')),
                    //     DataCell(DropdownExample()),
                    //     const DataCell(const Text('....')),
                    //   ]),
                    //   DataRow(cells: [
                    //     const DataCell(Text('10')),
                    //     DataCell(DropdownExample()),
                    //     const DataCell(Text('...')),
                    //   ]),
                    //   DataRow(cells: [
                    //     const DataCell(const Text('15')),
                    //     DataCell(DropdownExample()),
                    //     const DataCell(const Text('....')),
                    //   ]),
                    // ],
                  );
                }))
              : Loading();
        });
    //child:
  }
}

class DropdownExample extends StatefulWidget {
  @override
  _DropdownExampleState createState() {
    return _DropdownExampleState();
  }
}

class _DropdownExampleState extends State<DropdownExample> {
  String? _value;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        items: [
          const DropdownMenuItem<String>(
            child: Text('In Process'),
            value: 'one',
          ),
          const DropdownMenuItem<String>(
            child: Text('Prepared'),
            value: 'two',
          ),
        ],
        onChanged: (String? value) {
          setState(() {
            _value = value;
          });
        },
        hint: const Text('Pending'),
        value: _value,
        isExpanded: true,
      ),
    );
  }
}
