import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? height;

  const MyCustomAppBar({
    Key? key,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.teal[100],
          child: Padding(
            padding: EdgeInsets.all(0),
            child: AppBar(
              backgroundColor: Colors.teal,
              title: Center(
                child: const Text(''),
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
            ),
          ),
        ),
      ],
    );
  }

  // void _searchbar(BuildContext context) {
  //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => new SearchBarDemoHome()));
  // }

  @override
  Size get preferredSize => Size.fromHeight(height!);
}
