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
  DateFormat date = DateFormat("dd/MM");
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
            child: Text('Pending Items',
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
            label: Flexible(child: Text("")),
          ),
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
                      softWrap: true,
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
                  Flexible(
                    child: MaterialButton(
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
