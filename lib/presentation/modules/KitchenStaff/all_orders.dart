import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:food365/domain/models/modules/ordering/order.dart';
import 'package:food365/domain/services/order_service.dart';
import 'package:food365/presentation/modules/KitchenStaff/items_modal.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class AllOrders extends StatelessWidget {
  showAllItems(context, orderID, orderItems) {
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
    // final service = OrderService().getbyRef();

    // final orders = [];
    // DatabaseReference ref = FirebaseDatabase.instance.ref();
    // final snapshot =  ref.child("Menu").get();
    // if (snapshot) {
    //   print(snapshot.value);
    // } else {
    //   print('No data available.');
    // }

    return LoaderOverlay(
      child: DataTable(
        columns: [
          const DataColumn(
              label: Text('OrderID',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          //const DataColumn(
          // label: Text('Status',
          //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          // const DataColumn(
          //     label: const T ext('TimeLeft',
          //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
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
                    //width: 100,
                    child: Column(
                      children: [
                        Text(
                          e.orderID.toString(),
                        ),
                        Text(
                          
                          e.createdAgo,
                        ),
                      ],
                    ),
                  ),
                ),
                // DataCell(Text(e.serviceStatus == true
                //     ? "Served"
                //     : e.readyStatus == true
                //         ? "Ready"
                //         : e.cookingStatus == true
                //             ? "In progress"
                //             : "Pending")),
                //const DataCell(const Text('....')),
                DataCell(
                  ElevatedButton(
                    onPressed: () {
                      print(e.items.first.cookingStatus);
                      showAllItems(context, e.orderID, e.items);
                    },
                    child: Text("View"),
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
