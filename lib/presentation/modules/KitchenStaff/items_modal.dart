import 'package:flutter/material.dart';

import 'package:food365/domain/models/modules/ordering/order_item.dart';
import 'package:food365/domain/services/order_service.dart';
import 'package:food365/presentation/utils/constants.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ItemsModal extends StatelessWidget {
  final List<OrderItem> orderItems;
  final String orderID;
  const ItemsModal({
    Key? key,
    required this.orderItems,
    required this.orderID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(orderItems);
    return Container(
        // height: 100,
        padding: EdgeInsets.all(8),
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) => Divider(
            color: Colors.black,
          ),
          itemCount: orderItems.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              color: Color.fromRGBO(255, 215, 64, 1),
              child: Myexpansiontile(),
              // child: ListTile(
              //   title: Text(
              //     "${orderItems[index].menuName}",
              //     style: titleStyle,
              //     textAlign: TextAlign.center,
              //   ),
              //   subtitle: Container(
              //     height: 45,
              //     child: Text(
              //       "Quantity: ${orderItems[index].quantity}",
              //       style: titleStyle,
              //       textAlign: TextAlign.center,
              //     ),
              //   ),

              //   trailing: ToggleSwitch(
              //     initialLabelIndex: 2,
              //     cornerRadius: 20.0,
              //     activeFgColor: Colors.white,
              //     inactiveBgColor: Colors.grey,
              //     inactiveFgColor: Colors.white,
              //     totalSwitches: 4,
              //     //customWidths: [300.0, 100.0, 100.0, 100.0],
              //     labels: ["Pending", "Cooking", "Ready", "Served"],
              //     //icons: [Icons.male, Icons.female, Icons.transgender],
              //     iconSize: 30.0,
              //     borderWidth: 2.0,
              //     borderColor: [Colors.blueGrey],
              //     activeBgColors: [
              //       [Colors.red],
              //       [Colors.yellow],
              //       [Colors.green],
              //       [Colors.deepPurple]
              //     ],
              //     onToggle: (index) {
              //       print('switched to: $index');
              //     },
              //   ),
                // trailing: orderItems[index].serviceStatus == true
                //     ? ElevatedButton(
                //         onPressed: () {},
                //         child: Text("Served"),
                //       )
                //     : orderItems[index].readyStatus == true
                //         ? ElevatedButton(
                //             onPressed: () {
                //               OrderService().updateOrderItemCookingStatus(
                //                   id: index,
                //                   orderItem: orderItems[index],
                //                   orderID: orderID);
                //             },
                //             child: Text("Ready"))
                //         : orderItems[index].cookingStatus == true
                //             ? ElevatedButton(
                //                 onPressed: () {
                //                   OrderService().updateOrderItemReadyStatus(
                //                       id: index,
                //                       orderItem: orderItems[index],
                //                       orderID: orderID);
                //                 },
                //                 child: Text("In Progress"))
                //             : ElevatedButton(
                //                 onPressed: () {
                //                   OrderService().updateOrderItemCookingStatus(
                //                       id: index,
                //                       orderItem: orderItems[index],
                //                       orderID: orderID);
                //                 },
                //                 child: Text("Pending"),
                //               ),
              ),
            ),
          ),
        );
  }
}

class Myexpansiontile extends StatefulWidget {
  const Myexpansiontile({ Key? key }) : super(key: key);

  @override
  State<Myexpansiontile> createState() => _MyexpansiontileState();
}

class _MyexpansiontileState extends State<Myexpansiontile> {
  bool _myTileExpanded = false;
  @override
  Widget build(BuildContext context) {
   return Column(
      children: <Widget>[
         ExpansionTile(
          title: Text('ExpansionTile 1'),
          subtitle: Text('Trailing expansion arrow icon'),
          children: <Widget>[
              ToggleSwitch(
                  initialLabelIndex: 2,
                  cornerRadius: 20.0,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 4,
                  //customWidths: [300.0, 100.0, 100.0, 100.0],
                  labels: ["Pending", "Cooking", "Ready", "Served"],
                  //icons: [Icons.male, Icons.female, Icons.transgender],
                  iconSize: 30.0,
                  borderWidth: 2.0,
                  borderColor: [Colors.blueGrey],
                  activeBgColors: [
                    [Colors.red],
                    [Colors.yellow],
                    [Colors.green],
                    [Colors.deepPurple]
                  ],
                  onToggle: (index) {
                    print('switched to: $index');
                  },
                ),
               
          ],
        ),
        
      ],
    );
  
  }
}