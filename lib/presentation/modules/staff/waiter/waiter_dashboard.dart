import 'package:flutter/material.dart';
import 'package:food365/presentation/modules/staff/waiter/side_drawer.dart';

class WaiterDashboard extends StatelessWidget {
  static const String id = 'waiter dashboard';
  const WaiterDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Waiter"),
        ),
        drawer: CustomSideDrawer(),
        body: Column(
          children: [
            const Text(
              "Current Orders",
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(
              height: 16,
            ),
            Table(
              // defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: const <TableRow>[
                TableRow(
                  children: <Widget>[
                    Center(
                      child: TableCell(
                        child: Text("Order No"),
                      ),
                    ),
                    Center(
                      child: TableCell(
                        child: Text("Table No"),
                      ),
                    ),
                    Center(
                      child: TableCell(
                        child: Text("Expected Waiting Time"),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Center(child: Text("1")),
                    Center(child: Text("4")),
                    Center(child: Text("15 min")),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
