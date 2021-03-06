import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food365/presentation/modules/KitchenStaff/items_modal.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import 'package:food365/domain/models/modules/ordering/menu_item_model.dart';
import 'package:food365/domain/models/modules/ordering/order.dart';
import 'package:food365/domain/services/order_service.dart';

class CurrentOrders extends StatelessWidget {
  showCurrentItems(context, orderID, orderItems) {
   
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

    return DataTable(
      key: Key("${Random().nextDouble()}"),
      columns: [
        const DataColumn(
            label: Text('OrderID',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        const DataColumn(
            label: Text('Pending items ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        DataColumn(
          label: Text(""),
        ),
        // const DataColumn(
        //     label: const Text('TimeLeft',
        //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
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
              DataCell(
                Text(e.pendingItems.toString())
              ),
              DataCell(
                  ElevatedButton(
                    onPressed: () {
                      print(e.items.first.cookingStatus);
                      showCurrentItems(context, e.orderID, e.items);
                    },
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

class ButtonStatus extends StatefulWidget {
  final OrderModel order;
  ButtonStatus({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  _ButtonStatus createState() => _ButtonStatus();
}

class _ButtonStatus extends State<ButtonStatus> {
  var buttonText = 'Pending';
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
            onPressed: () {
              OrderService().updateCookingStatus(order: widget.order);
              setState(() {
                buttonText = 'In Process';
              });
            },
            style: ButtonStyle(
                backgroundColor: buttonText == "Pending"
                    ? MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 207, 22, 9))
                    : MaterialStateProperty.all<Color>(Colors.teal)),
            child: Text(buttonText)));
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
