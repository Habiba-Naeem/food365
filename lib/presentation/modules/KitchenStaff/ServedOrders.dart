import 'package:flutter/material.dart';
import 'package:food365/presentation/modules/KitchenStaff/items_modal.dart';
import 'package:food365/utils/colors.dart';
import 'package:food365/utils/custom_style.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/modules/ordering/order.dart';

class ServedOrders extends StatelessWidget {
  DateFormat date = DateFormat("dd/MM");
  DateFormat time = DateFormat("hh:mm:ss a");
  showServedItems(context, orderID, orderItems) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: ItemsModal(
          orderItems: orderItems,
          orderID: orderID,
          waiter: false,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<List<OrderModel>>(context);
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: DataTable(
        columnSpacing: 15,
        columns: [
          DataColumn(
              label: Flexible(
            child: Text('OrderID',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          )),
          DataColumn(
              label: Flexible(
            child: Text('Ready Items',
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
                DataCell(Text(e.serviceStatus.toString().toUpperCase())),
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
                      showServedItems(context, e.orderID, e.items);
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
