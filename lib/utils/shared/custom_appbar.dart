import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:http/retry.dart';

// class MyCustomAppBar extends StatefulWidget {
//   String headingText;
//    MyCustomAppBar({
//     Key? key,
//     required this.headingText,
//   }) : super(key: key);

//   @override
//   _MyCustomAppBarState createState() => _MyCustomAppBarState();
// }

// class _MyCustomAppBarState extends State<MyCustomAppBar> {
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: Colors.teal,
//       title: Center(
//         child:  Text("${widget.headingText}"),
//       ),
//       leading: Container(
//         color: Colors.white,
//         child: TextField(
//           decoration: InputDecoration(
//             hintText: "Search",
//             contentPadding: EdgeInsets.all(10),
//           ),
//         ),
//       ),
//       actions: [
//         IconButton(icon: Icon(Icons.search), onPressed: () => null),
//       ],
//     );
//   }
// }
class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? height;
  String headingText;
  MyCustomAppBar({
    Key? key,
    this.height,
    required this.headingText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
    bottom: Radius.circular(16),
    ),),
      backgroundColor: Colors.teal,
      title: Center(
        child: Text(headingText),
      ),
      // title: Container(
      //   color: Colors.white,
      //   child: TextField(
      //     decoration: InputDecoration(
      //       hintText: "Search",
      //       contentPadding: EdgeInsets.all(10),
      //     ),
      //   ),
      // ),
      actions: [
        IconButton(icon: Icon(Icons.search), onPressed: () => null),
      ],
    );
  }

  // void _searchbar(BuildContext context) {
  //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => new SearchBarDemoHome()));
  // }

  @override
  Size get preferredSize => Size.fromHeight(58);
}
