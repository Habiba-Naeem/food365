import 'package:flutter/material.dart';

class CurrentOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(children: <Widget>[
        DataTable(
          columns: [
            DataColumn(label: Text('OrderID', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            DataColumn(label: Text('Status', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            DataColumn(label: Text('TimeLeft', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('1')),
              DataCell(DropdownExample()),
              DataCell(Text('....')),
            ]),
            DataRow(cells: [
              DataCell(Text('5')),
              DataCell(DropdownExample()),
              DataCell(Text('....')),
            ]),
            DataRow(cells: [
              DataCell(Text('10')),
              DataCell(DropdownExample()),
              DataCell(Text('...')),
            ]),
            DataRow(cells: [
              DataCell(Text('15')),
              DataCell(DropdownExample()),
              DataCell(Text('....')),
            ]),
          ],
        ),
      ]),
    );
  }
}

class DropdownExample extends StatefulWidget {
  @override
  _DropdownExampleState createState() {
    return _DropdownExampleState();
  }
}

class _DropdownExampleState extends State<DropdownExample> {
  String? _value;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        items: [
          DropdownMenuItem<String>(
            child: Text('In Process'),
            value: 'one',
          ),
          DropdownMenuItem<String>(
            child: Text('Prepared'),
            value: 'two',
          ),
        ],
        onChanged: (String? value) {
          setState(() {
            _value = value;
          });
        },
        hint: Text('Pending'),
        value: _value,
        isExpanded: true,
      ),
    );
  }
}
