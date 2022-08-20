import 'package:flutter/material.dart';
import 'package:food365/domain/services/order_status_service.dart';
import 'package:food365/utils/custom_style.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

import 'package:food365/domain/models/modules/ordering/order_item.dart';
import 'package:food365/domain/services/order_service.dart';

import '../../../utils/colors.dart';
import '../../../utils/shared/widgets/toggle_switch.dart';

class ItemsModal extends StatelessWidget {
  final List<OrderItem> orderItems;

  final String orderID;
  const ItemsModal({
    Key key,
     this.orderItems,
     this.orderID,
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
            color: CustomColor.primaryColor,
            child: Myexpansiontile(
              orderItem: orderItems[index],
              orderID: orderID,
              orderItemID: index,
            ),
          ),
        ),
      ),
    );
  }
}

class Myexpansiontile extends StatefulWidget {
  final OrderItem orderItem;
  final int orderItemID;
  final String orderID;
  const Myexpansiontile({
    Key key,
     this.orderItem,
     this.orderID,
     this.orderItemID,
  }) : super(key: key);

  @override
  State<Myexpansiontile> createState() => _MyexpansiontileState();
}

class _MyexpansiontileState extends State<Myexpansiontile> {
  bool _myTileExpanded = false;

   int initialIndex;
  @override
  initState() {
    initialIndex = getIndex();
    super.initState();
  }

  getIndex() {
    return widget.orderItem.serviceStatus == true
        ? 3
        : widget.orderItem.readyStatus == true
            ? 2
            : widget.orderItem.cookingStatus == true
                ? 1
                : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ExpansionTile(
          title: Text(widget.orderItem.menuName,style: CustomStyle.headingStyle.merge(TextStyle(color: CustomColor.whiteColor ) )),
          subtitle: Text('Quantity: ${widget.orderItem.quantity}',style: CustomStyle.subHeadingStyle.merge(TextStyle(color: CustomColor.whiteColor ) ),),

          children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ToggleSwitch(
                initialLabelIndex: initialIndex,
                cornerRadius: 20.0,
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.white,
disableindex: [3],
                //totalSwitches: 4,
                labels: ["Pending", "Cooking", "Ready", "Served"],
                iconSize: 30.0,
                borderWidth: 2.0,
                borderColor: [Colors.blueGrey],
                activeBgColors: [
                  [Colors.red],
                  [Color.fromARGB(255, 255, 203, 59)],
                  [Colors.green],
                  [Colors.deepPurple]
                ],
                onToggle: (index) {

                  index == 1
                      ? OrderStatusService().updateOrderItemCookingStatus(
                          id: widget.orderItemID,
                          orderItem: widget.orderItem,
                          orderID: widget.orderID)
                      : index == 2
                          ? OrderStatusService().updateOrderItemReadyStatus(
                              id: widget.orderItemID,
                              orderItem: widget.orderItem,
                              orderID: widget.orderID)
                          : index == 3
                              ? OrderStatusService().updateOrderItemServiceStatus(
                                  id: widget.orderItemID,
                                  orderItem: widget.orderItem,
                                  orderID: widget.orderID)
                              : () {};
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
