import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:food365/domain/models/modules/ordering/order.dart';
import 'package:food365/domain/models/modules/ordering/order_item.dart';
import 'package:food365/domain/providers/timer_provider.dart';
import 'package:food365/domain/services/menu_service.dart';
import 'package:food365/presentation/modules/staff/waiter/items_modal.dart';
import 'package:food365/presentation/style.dart';
import 'package:food365/utils/colors.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class AllOrders extends StatelessWidget {
  showAllItems(context, orderID, orderItems) {
    //final OrderModel order = e;
    print(orderItems.runtimeType);

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
    final orders = Provider.of<List<OrderModel>>(context, listen: false);

    return LoaderOverlay(
      child: DataTable(
        columns: [
          const DataColumn(
              label: Text('OrderID',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          // const DataColumn(
          //     label: Text('Status',
          //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          const DataColumn(
              label: const Text('TimeLeft',
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
                  Container(
                    width: 100,
                    child: Text(
                      e.orderID.toString(),
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

                DataCell(Timer(
                  order: e,
                )),
                // DataCell(Text(TimerProvider(order: e).totalTime.toString())),
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
      height: MediaQuery.of(context).size.height / 2,

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
