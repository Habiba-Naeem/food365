import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:food365/domain/models/modules/ordering/menu_item_model.dart';
import 'package:food365/domain/models/modules/ordering/order.dart';
import 'package:food365/domain/services/order_service.dart';
import 'package:food365/presentation/shared/loading.dart';

class CurrentOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<List<OrderModel>>(context);

    return DataTable(
      key: Key("${Random().nextDouble()}"),
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
              DataCell(Text(e.cookingStatus == false ? "Pending" : "")),
              const DataCell(const Text('....')),
            ],
          );
        })
      ],
    );
  }
}

// class DropDownExample extends StatefulWidget {
//    String state;
//    DropDownExample({
//     Key? key,
//     required this.state,
//   }) : super(key: key);

//   @override
//   _DropDownExampleState createState() => _DropDownExampleState();
// }

// class _DropDownExampleState extends State<DropDownExample> {
//   String? _value;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: DropdownButton<String>(
//         items: [
//           const DropdownMenuItem<String>(
//             child: Text('In Process'),
//             value: 'one',
//           ),
//           const DropdownMenuItem<String>(
//             child: Text('Prepared'),
//             value: 'two',
//           ),
//         ],
//         onChanged: (String? value) {
//           setState(() {
//             _value = value;
//           });
//         },
//         hint: const Text('Pending'),
//         value: _value,
//         isExpanded: true,
//       ),
//     );
//   }
// }

// class DropdownExample extends StatefulWidget {
//   @override
//   _DropdownExampleState createState() {
//     return _DropdownExampleState();
//   }
// }

// class _DropdownExampleState extends State<DropdownExample> {
//   String? _value;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: DropdownButton<String>(
//         items: [
//           const DropdownMenuItem<String>(
//             child: Text('In Process'),
//             value: 'one',
//           ),
//           const DropdownMenuItem<String>(
//             child: Text('Prepared'),
//             value: 'two',
//           ),
//         ],
//         onChanged: (String? value) {
//           setState(() {
//             _value = value;
//           });
//         },
//         hint: const Text('Pending'),
//         value: _value,
//         isExpanded: true,
//       ),
//     );
//   }
// }
