import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food365/domain/services/order_status_service.dart';
import 'package:food365/presentation/modules/KitchenStaff/items_modal.dart';
import 'package:food365/utils/colors.dart';
import 'package:food365/utils/custom_style.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import 'package:food365/domain/models/modules/ordering/menu_item_model.dart';
import 'package:food365/domain/models/modules/ordering/order.dart';
import 'package:food365/domain/services/order_service.dart';

class CurrentOrders extends StatelessWidget {
  DateFormat date = DateFormat("dd/MM/yyyy");
  DateFormat time = DateFormat("hh:mm:ss a");

  showCurrentItems(context, orderID, orderItems) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: ItemsModal(
          orderItems: orderItems,
          orderID: orderID,
          waiter: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<List<OrderModel>>(context, listen: false);

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: DataTable(
        key: Key("${Random().nextDouble()}"),
        columnSpacing: 10,
        columns: [
          DataColumn(
              label: Flexible(
            child: Text('OrderID',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          )),
          DataColumn(
              label: Flexible(
            child: Text('Pending',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          )),
          DataColumn(
              label: Flexible(
            child: Text('Date',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          )),
          DataColumn(
              label: Flexible(
            child: Text('Time',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          )),
          DataColumn(
              label: Flexible(
            child: Text('',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          )),
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
                      style: CustomStyle.subHeadingStyle,
                    ),
                  ),
                ),
                DataCell(Text(e.pendingItems.toString())),
                DataCell(
                  SizedBox(
                    //width: 100,
                    child: Text(
                      date.format(e.createdAt).toString(),
                    ),
                  ),
                ),
                DataCell(
                  SizedBox(
                    //width: 100,
                    child: Text(
                      time.format(e.createdAt).toString(),
                    ),
                  ),
                ),
                DataCell(
                  MaterialButton(
                    onPressed: () {
                      print(e.items.first.cookingStatus);
                      showCurrentItems(context, e.orderID, e.items);
                    },
                    child: Text(
                      "View",
                      style: CustomStyle.appbarTitleStyle
                          .merge(TextStyle(fontSize: 15)),
                    ),
                    color: CustomColor.primaryColor,
                  ),
                )
              ],
            );
          })
        ],
      ),
    );
  }
}

class ButtonStatus extends StatefulWidget {
  final OrderModel order;
  ButtonStatus({
    Key key,
    this.order,
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
              //OrderStatusService().updateCookingStatus(order: widget.order);
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
//     Key key,
//      this.state,
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
