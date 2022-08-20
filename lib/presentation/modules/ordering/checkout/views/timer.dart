import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:food365/domain/models/modules/ordering/order.dart';
import 'package:food365/domain/providers/timer_provider.dart';
import 'package:food365/domain/services/order_service.dart';
import 'package:food365/utils/shared/loading.dart';

import '../../../../../domain/services/menu_service.dart';
import '../../../../../utils/colors.dart';
import '../../../../../utils/custom_style.dart';

class TimePage extends StatefulWidget {
  static const String id = "Timer";
  String orderID;
  OrderModel order;
  TimePage({
    key,
    this.orderID,
    this.order,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
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
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Expected time left",
            style: CustomStyle.appbarTitleStyle,
          ),
          backgroundColor: CustomColor.primaryColor,
          leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowAltCircleLeft,
                color: CustomColor.whiteColor),
            onPressed: () => Navigator.of(context).pop(),
          )),
      body: Column(
        children: [
          Center(
            child: loader
                ? Loading()
                : CircularCountDownTimer(
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
                  ),

            // FutureBuilder(
            //   future: TimerProvider().getTime(order: widget.order),
            //   builder: (context, snapshot) {
            //     print("timersnapshot data");
            //     print(snapshot.hasData ? snapshot.data : "no data");
            //     return
            //   },
            // ),
          ),

          Text("Your order id is ${order.orderID}",style: CustomStyle.subHeadingStyle.merge(TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),),
          SizedBox(height: 10,),
          ElevatedButton(
            child: Text("SHOW BILL",style: CustomStyle.headingStyle,),
          )
        ],
      ),

      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     const SizedBox(
      //       width: 30,
      //     ),
      //     _button(title: "Change Order", onPressed: () => _controller.start()),
      //   ],
      // ),
    );
  }

  getnoTime() {
    order.allOrderItems.forEach((item) async {
      MenuService().getMenuItem(menuItemID: item.menuItemID).then((value) {
        _duration = (_duration + value.time);
      }).whenComplete(() {
        setState(() {
          loader = false;
          time = (_duration.inMinutes / order.allOrderItems.length).toInt();
        });
        //print("sum");
        //print(_d.inMinutes / order.allOrderItems.length);
        //return ((sum.inMinutes));
      });
    });
  }

  Widget _button({String title, VoidCallback onPressed}) {
    return Expanded(
        child: ElevatedButton(
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.teal),
      ),
      onPressed: onPressed,
    ));
  }
}
