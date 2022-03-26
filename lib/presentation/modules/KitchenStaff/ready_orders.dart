import 'package:flutter/material.dart';
import 'package:food365/domain/services/order_service.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/modules/ordering/order.dart';

class ReadyOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<List<OrderModel>>(context);
    return ListView(children: <Widget>[
      DataTable(
        columns: [
          DataColumn(
              label: Text('OrderID',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Status',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
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
                DataCell(ButtonStatus(
                order: e,
              )),
                const DataCell(const Text('....')),
              ],
            );
          })
        ],
      ),
    ]);
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
  var buttonText = 'In Progress';
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
          
            onPressed: () {
              OrderService().updateReadyStatus(order: widget.order);
              setState(() {
                buttonText = 'Ready';
              });
            },
            style: ButtonStyle(
                backgroundColor: buttonText == "In progress"
                    ? MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 250, 246, 11))
                    : MaterialStateProperty.all<Color>(Colors.teal)),
            child: Text(buttonText)));
  }
}