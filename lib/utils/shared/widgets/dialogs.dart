import 'package:flutter/material.dart';
import 'package:food365/utils/colors.dart';

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    color:CustomColor.primaryColor,
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text("Order Confirmation"),
    content: Text("Your Order has been placed. Thank you!"),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showErrorDialog(BuildContext context, String cause) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    color: CustomColor.primaryColor2,
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text("Error Occured"),
    content: Text(cause),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
