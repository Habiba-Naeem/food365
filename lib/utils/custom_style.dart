import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
import 'dimensions.dart';

class CustomStyle {
  static var appbarTitleStyle=GoogleFonts.roboto(
      color: CustomColor.textColor,
      fontSize:22,

      fontWeight: FontWeight.bold
  );
  static var headingStyle=GoogleFonts.roboto(
      color: CustomColor.primaryColor,
      fontSize: Dimensions.headingTextSize,
      fontWeight: FontWeight.bold
  );
  static var sideBarTextStyle=GoogleFonts.roboto(
    color: CustomColor.primaryColor,
    fontSize: Dimensions.headingTextSize,
  );
  static var subHeadingStyle=GoogleFonts.roboto(
      color: CustomColor.primaryColor,
      fontSize: Dimensions.largeTextSize,
  );
  static var buttonStyle=GoogleFonts.roboto(
      color: CustomColor.textColor,
      fontSize: 16,
      fontWeight: FontWeight.bold
  );
  static var textStyle = GoogleFonts.roboto(
      color: CustomColor.greyColor,
      fontSize: Dimensions.defaultTextSize
  );

  static var hintTextStyle = GoogleFonts.roboto(
      color: Colors.grey.withOpacity(0.5),
      fontSize: Dimensions.defaultTextSize
  );

  static var errorTextStyle = GoogleFonts.roboto(
      color: Colors.redAccent,
      fontSize: Dimensions.defaultTextSize
  );

  static var listStyle = GoogleFonts.roboto(
      color: CustomColor.redDarkColor,
      fontSize: Dimensions.defaultTextSize
  );

  static var defaultStyle = GoogleFonts.roboto(
      color: Colors.black,
      fontSize: Dimensions.largeTextSize
  );

  static var focusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
    borderSide: BorderSide(color: Colors.black.withOpacity(0.1), width: 2.0),
  );

  static var focusErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
    borderSide: BorderSide(color: CustomColor.primaryColor, width: 1.0),

  );

  TextStyle kChatBubbleTextStyle = TextStyle(
    fontSize: 17,
    color: CustomColor.whiteColor,
  );

  TextStyle kReplyTitleStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  TextStyle kReplySubtitleStyle = TextStyle(
    fontSize: 14,
    color: CustomColor.greyColor,
  );


}