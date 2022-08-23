import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:food365/domain/models/modules/ordering/order.dart';
import 'package:food365/domain/models/modules/ordering/order_item.dart';
import 'package:food365/domain/providers/timer_provider.dart';
import 'package:food365/domain/services/menu_service.dart';
import 'package:food365/presentation/modules/KitchenStaff/items_modal.dart';
import 'package:food365/presentation/style.dart';
import 'package:food365/utils/colors.dart';
import 'package:food365/utils/shared/loading.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../../../utils/custom_style.dart';

class AllOrders extends StatefulWidget {
  @override
  State<AllOrders> createState() => _AllOrdersState();
}

class _AllOrdersState extends State<AllOrders> {
  final CountDownController _controller = CountDownController();
  Duration _duration = Duration();

  bool loader = true;

  int timer = 0;

  OrderModel order;

  int i = 0;

  DateFormat date = new DateFormat("MM/dd/yyyy");

  DateFormat time = new DateFormat("hh:mm:ss a");

  showAllItems(context, orderID, orderItems) {
    //final OrderModel order = e;
    print(orderItems.runtimeType);

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
    // getTime() {
    //   order.allOrderItems.forEach(
    //     (item) async {
    //       await MenuService()
    //           .getMenuItem(menuItemID: item.menuItemID)
    //           .then((value) {
    //         print(value.time);
    //         _duration = (_duration + value.time);
    //       });
    //       if (item == order.allOrderItems.last) {
    //         loader = false;
    //         timer = (_duration.inSeconds ~/ order.allOrderItems.length).toInt();
    //         print(time);
    //       }
    //     },
    //   );
    // }

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: DataTable(
        columnSpacing: 15,
        columns: [
          const DataColumn(
              label: Text('OrderID',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          const DataColumn(
              label: Text('Date',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          const DataColumn(
              label: Text('Time',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          // const DataColumn(
          //     label: Text('Time Left',
          //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
            label: Text(""),
          ),
        ],
        rows: [
          ...orders.map((e) {
            // getTime();
            // e.allOrderItems.forEach(
            //   (item) async {
            //     await MenuService()
            //         .getMenuItem(menuItemID: item.menuItemID)
            //         .then((value) {
            //       print(value.time);
            //       i = i + 1;

            //       setState(() {
            //         _duration = (_duration + value.time);
            //       });
            //     });
            // if (i == e.allOrderItems.length) {
            //   loader = false;
            //   timer = (_duration.inSeconds ~/ e.allOrderItems.length)
            //       .toInt();

            //   print(time);
            // }
            //   },
            // );

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
                // DataCell(
                //   Flexible(child: Text(_duration.toString())),
                // ),
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
                ),
              ],
            );
          })
        ],
      ),
    );
  }
}

class Timer extends StatefulWidget {
  static const String id = "Timer";
  String orderID;
  OrderModel order;
  Timer({
    key,
    this.orderID,
    this.order,
  }) : super(key: key);

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  Duration _duration = Duration();
  bool loader = true;
  int time = 0;
  OrderModel order;
  int i = 0;
  final CountDownController _controller = CountDownController();

  @override
  void initState() {
    // TODO: implement initState
    order = widget.order;
    getTime();
    super.initState();
  }

  getTime() {
    order.allOrderItems.forEach(
      (item) async {
        await MenuService()
            .getMenuItem(menuItemID: item.menuItemID)
            .then((value) {
          print(value.time);
          _duration = (_duration + value.time);
        });
        if (item == order.allOrderItems.last) {
          setState(
            () {
              loader = false;
              time =
                  (_duration.inSeconds ~/ order.allOrderItems.length).toInt();
              print(time);
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
      // Countdown duration in Seconds.
      duration: time,

      // Countdown initial elapsed Duration in Seconds.
      //initialDuration: _duration.inSeconds,

      // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
      controller: _controller,

      // Width of the Countdown Widget.
      width: MediaQuery.of(context).size.width / 2,

      // Height of the Countdown Widget.
      // height: MediaQuery.of(context).size.height / 2,
      height: 15,
      // Ring Color for Countdown Widget.
      ringColor: Colors.grey[300],

      // Ring Gradient for Countdown Widget.
      ringGradient: null,

      // Filling Color for Countdown Widget.
      fillColor: Colors.tealAccent,

      // Filling Gradient for Countdown Widget.
      fillGradient: null,

      // Background Color for Countdown Widget.
      backgroundColor: CustomColor.primaryColor,

      // Background Gradient for Countdown Widget.
      backgroundGradient: null,

      // Border Thickness of the Countdown Ring.
      strokeWidth: 5.0,

      // Begin and end contours with a flat edge and no extension.
      strokeCap: StrokeCap.butt,

      // Text Style for Countdown Text.
      textStyle: const TextStyle(
        fontSize: 33.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),

      // Format for the Countdown Text.
      textFormat: CountdownTextFormat.MM_SS,

      // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
      isReverse: true,

      // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
      isReverseAnimation: true,

      // Handles visibility of the Countdown Text.
      isTimerTextShown: true,

      // Handles the timer start.
      autoStart: true,

      // This Callback will execute when the Countdown Starts.
      onStart: () {
        // Here, do whatever you want
        debugPrint('Countdown Started');
      },

      // This Callback will execute when the Countdown Ends.
      onComplete: () {
        // Here, do whatever you want
        debugPrint('Countdown Ended');
      },
    );
  }
}
