import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food365/domain/models/modules/ordering/order.dart';
import 'package:food365/domain/models/providers/timer_provider.dart';
import 'package:food365/utils/shared/loading.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  static const String id = "Timer";
  OrderModel order;
  MyHomePage({Key? key, this.title, required this.order}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Duration _duration = Duration();

  final CountDownController _controller = CountDownController();
  @override
  void initState()  {
   
    //TimerProvider().getTime(order: widget.order);
    //  widget.order.serviceTimeLeft();
    // _duration = widget.order.allTimeLeft;
    // print(_duration);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your order will be served in ..."),
      ),
      body: Center(
          child: FutureBuilder<Duration>(
            future: TimerProvider().getTime(order: widget.order),
            builder: (context, snapshot) {
              return CircularCountDownTimer(
                  // Countdown duration in Seconds.
                  //duration: 10,
                  duration: 10,
                  // Countdown initial elapsed Duration in Seconds.
                  //
                  //initialDuration: _duration.inSeconds,
          
                  // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
                  controller: _controller,
          
                  // Width of the Countdown Widget.
                  width: MediaQuery.of(context).size.width / 2,
          
                  // Height of the Countdown Widget.
                  height: MediaQuery.of(context).size.height / 2,
          
                  // Ring Color for Countdown Widget.
                  ringColor: Colors.grey[300]!,
          
                  // Ring Gradient for Countdown Widget.
                  ringGradient: null,
          
                  // Filling Color for Countdown Widget.
                  fillColor: Colors.tealAccent,
          
                  // Filling Gradient for Countdown Widget.
                  fillGradient: null,
          
                  // Background Color for Countdown Widget.
                  backgroundColor: Colors.teal,
          
                  // Background Gradient for Countdown Widget.
                  backgroundGradient: null,
          
                  // Border Thickness of the Countdown Ring.
                  strokeWidth: 20.0,
          
                  // Begin and end contours with a flat edge and no extension.
                  strokeCap: StrokeCap.butt,
          
                  // Text Style for Countdown Text.
                  textStyle: const TextStyle(
              fontSize: 33.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
                  ),
          
                  // Format for the Countdown Text.
                  textFormat: CountdownTextFormat.S,
          
                  // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
                  isReverse: false,
          
                  // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
                  isReverseAnimation: false,
          
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
          )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 30,
          ),
          _button(title: "Change Order", onPressed: () => _controller.start()),
        ],
      ),
    );
  }

  Widget _button({required String title, VoidCallback? onPressed}) {
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
