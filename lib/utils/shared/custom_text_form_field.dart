import 'package:flutter/material.dart';

class ResponsiveWidget {
  static bool isScreenLarge(double width, double pixel) {
    return width * pixel >= 1440;
  }

  static bool isScreenMedium(double width, double pixel) {
    return width * pixel < 1440 && width * pixel >= 1080;
  }

  static bool isScreenSmall(double width, double pixel) {
    return width * pixel <= 720;
  }
}

class CustomTextField extends StatefulWidget {
  final String hint;
  //final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData icon;
  //  double width;
  //  double pixelRatio;
  //  bool large;
  //  bool medium;

  CustomTextField({
    Key? key,
    required this.hint,
    required this.keyboardType,
    required this.obscureText,
    required this.icon,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String data = ' ';
  @override
  Widget build(BuildContext context) {
    // width = MediaQuery.of(context).size.width;
    // pixelRatio = MediaQuery.of(context).devicePixelRatio;
    // large =  ResponsiveWidget.isScreenLarge(width, pixelRatio);
    // medium=  ResponsiveWidget.isScreenMedium(width, pixelRatio);
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: 10, //large? 12 : (medium? 10 : 8),
      child: TextFormField(
        //controller: textEditingController,
        keyboardType: widget.keyboardType,
        cursorColor: Colors.orange[200],
        onChanged: (val) => setState(() => data = val),
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon, color: Colors.orange[200], size: 20),
          hintText: widget.hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
