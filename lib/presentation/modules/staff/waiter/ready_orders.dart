import 'package:flutter/material.dart';
import 'package:food365/domain/models/modules/ordering/order.dart';
import 'package:food365/domain/services/order_service.dart';
import 'package:food365/domain/services/order_status_service.dart';
import 'package:food365/presentation/modules/KitchenStaff/items_modal.dart';
import 'package:food365/utils/colors.dart';
import 'package:food365/utils/custom_style.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class ReadyOrders extends StatelessWidget {
  showReadyItems(context, orderID, orderItems) {
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
    return ListView(children: <Widget>[
      DataTable(
        columnSpacing: 20,
        columns: [
          DataColumn(
              label: Text('OrderID',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Ready Items',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('TimeTaken',
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
                    style: CustomStyle.subHeadingStyle,
                    ),
                  ),
                ),
                DataCell(Text(e.readyItems.toString())),
                DataCell(
                  MaterialButton(
                    onPressed: () {
                      print(e.items.first.cookingStatus);
                      showReadyItems(context, e.orderID, e.items);
                    },
                    child: Text("View",style: CustomStyle.appbarTitleStyle.merge(TextStyle(fontSize: 15)),),
               color: CustomColor.primaryColor,
                  ),
                )
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
    Key key,
     this.order,
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
              OrderStatusService().updateReadyStatus(order: widget.order);
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
