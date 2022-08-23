import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:food365/domain/models/modules/ordering/order.dart';
import 'package:food365/domain/services/order_service.dart';
import 'package:food365/presentation/modules/KitchenStaff/items_modal.dart';
import 'package:food365/utils/colors.dart';
import 'package:food365/utils/custom_style.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class AllOrders extends StatelessWidget {
  DateFormat date = DateFormat("dd/MM/yyyy");
  DateFormat time = DateFormat("hh:mm:ss a");
  showAllItems(context, orderID, orderItems) {
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
        sortAscending: true,
        columnSpacing: 18,
        columns: [
          DataColumn(
              label: Text('OrderID',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Date',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Time',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
            label: Text(""),
          ),
        ],
        rows: [
          ...orders.map((e) {
            return DataRow(
              cells: [
                DataCell(
                  SizedBox(
                    width: 80,
                    child: Text(
                      e.orderID.toString(),
                      style: CustomStyle.subHeadingStyle,
                    ),
                  ),
                ),
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
                      showAllItems(context, e.orderID, e.items);
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
