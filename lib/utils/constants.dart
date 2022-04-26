import 'package:flutter/material.dart';

const String success = "Success";
const String noInternet = "No internet connection";
const String somethingWentWrong = "Something went wrong. Try again later.";
const String databaseNotFound =
    "The database you were finding does not exists. Try again later.";
const String serviceUnavialable =
    "Service temporarily unavailable. Try again later.";

//color
Color mainColor = Color(0xFF004D40); //Color.fromARGB(255, 255, 217, 0);

//Style
final headerStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
final titleStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
final titleStyle2 = TextStyle(fontSize: 16, color: Colors.black45);
final subtitleStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
final infoStyle = TextStyle(fontSize: 12, color: Colors.black54);

//Decoration
final roundedRectangle12 = RoundedRectangleBorder(
  borderRadius: BorderRadiusDirectional.circular(12),
);

final roundedRectangle4 = RoundedRectangleBorder(
  borderRadius: BorderRadiusDirectional.circular(4),
);

final roundedRectangle40 = RoundedRectangleBorder(
  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
);

class Sizes {
  static const double SIZE_120 = 120.0;
  static const double SIZE_60 = 60.0;
  static const double SIZE_48 = 48.0;
  static const double SIZE_36 = 36.0;
  static const double SIZE_24 = 24.0;
  static const double SIZE_20 = 20.0;
  static const double SIZE_16 = 16.0;
  static const double SIZE_12 = 12.0;
  static const double SIZE_8 = 8.0;
  static const double SIZE_6 = 6.0;
  static const double SIZE_4 = 4.0;
  static const double SIZE_2 = 2.0;
  static const double SIZE_0 = 0.0;

  //TextSizes
  static const double TEXT_SIZE_50 = 50.0;
  static const double TEXT_SIZE_40 = 40.0;
  static const double TEXT_SIZE_36 = 36.0;
  static const double TEXT_SIZE_32 = 32.0;
  static const double TEXT_SIZE_28 = 28.0;
  static const double TEXT_SIZE_22 = 22.0;
  static const double TEXT_SIZE_20 = 20.0;
  static const double TEXT_SIZE_18 = 18.0;
  static const double TEXT_SIZE_16 = 16.0;
  static const double TEXT_SIZE_14 = 14.0;
  static const double TEXT_SIZE_12 = 12.0;
  static const double TEXT_SIZE_10 = 10.0;
  static const double TEXT_SIZE_8 = 8.0;

  //IconSizes
  static const double ICON_SIZE_50 = 50.0;
  static const double ICON_SIZE_40 = 40.0;
  static const double ICON_SIZE_32 = 32.0;
  static const double ICON_SIZE_24 = 24.0;
  static const double ICON_SIZE_22 = 22.0;
  static const double ICON_SIZE_20 = 20.0;
  static const double ICON_SIZE_18 = 18.0;
  static const double ICON_SIZE_16 = 16.0;
  static const double ICON_SIZE_14 = 14.0;
  static const double ICON_SIZE_12 = 12.0;
  static const double ICON_SIZE_10 = 10.0;
  static const double ICON_SIZE_8 = 8.0;

  //Heights
  static const double HEIGHT_300 = 300.0;
  static const double HEIGHT_240 = 240.0;
  static const double HEIGHT_200 = 200.0;
  static const double HEIGHT_180 = 180.0;
  static const double HEIGHT_160 = 160.0;
  static const double HEIGHT_150 = 150.0;
  static const double HEIGHT_130 = 130.0;
  static const double HEIGHT_100 = 100.0;
  static const double HEIGHT_60 = 60.0;
  static const double HEIGHT_50 = 50.0;
  static const double HEIGHT_48 = 48.0;
  static const double HEIGHT_46 = 46.0;
  static const double HEIGHT_44 = 44.0;
  static const double HEIGHT_40 = 40.0;
  static const double HEIGHT_36 = 36.0;
  static const double HEIGHT_32 = 32.0;
  static const double HEIGHT_24 = 24.0;
  static const double HEIGHT_22 = 22.0;
  static const double HEIGHT_20 = 20.0;
  static const double HEIGHT_18 = 18.0;
  static const double HEIGHT_16 = 16.0;
  static const double HEIGHT_14 = 14.0;
  static const double HEIGHT_10 = 10.0;
  static const double HEIGHT_8 = 8.0;

  //Widths
  static const double WIDTH_300 = 300.0;
  static const double WIDTH_236 = 236.0;
  static const double WIDTH_200 = 200.0;
  static const double WIDTH_170 = 170.0;
  static const double WIDTH_160 = 160.0;
  static const double WIDTH_150 = 150.0;
  static const double WIDTH_100 = 100.0;
  static const double WIDTH_60 = 60.0;
  static const double WIDTH_50 = 50.0;
  static const double WIDTH_40 = 40.0;
  static const double WIDTH_32 = 32.0;
  static const double WIDTH_22 = 22.0;
  static const double WIDTH_20 = 20.0;
  static const double WIDTH_18 = 18.0;
  static const double WIDTH_16 = 16.0;
  static const double WIDTH_14 = 14.0;
  static const double WIDTH_12 = 12.0;
  static const double WIDTH_10 = 10.0;
  static const double WIDTH_8 = 8.0;
  static const double WIDTH_6 = 6.0;
  static const double WIDTH_4 = 4.0;
  static const double WIDTH_1 = 1.0;
  static const double WIDTH_0 = 0.0;

  //Margins
  static const double MARGIN_200 = 200.0;
  static const double MARGIN_48 = 48.0;
  static const double MARGIN_60 = 60.0;
  static const double MARGIN_44 = 44.0;
  static const double MARGIN_40 = 40.0;
  static const double MARGIN_32 = 32.0;
  static const double MARGIN_30 = 30.0;
  static const double MARGIN_24 = 24.0;
  static const double MARGIN_22 = 22.0;
  static const double MARGIN_20 = 20.0;
  static const double MARGIN_18 = 18.0;
  static const double MARGIN_16 = 16.0;
  static const double MARGIN_14 = 14.0;
  static const double MARGIN_12 = 12.0;
  static const double MARGIN_10 = 10.0;
  static const double MARGIN_8 = 8.0;
  static const double MARGIN_4 = 4.0;
  static const double MARGIN_0 = 0.0;

  //Paddings
  static const double PADDING_40 = 40.0;
  static const double PADDING_36 = 36.0;
  static const double PADDING_32 = 32.0;
  static const double PADDING_24 = 24.0;
  static const double PADDING_22 = 22.0;
  static const double PADDING_20 = 20.0;
  static const double PADDING_18 = 18.0;
  static const double PADDING_16 = 16.0;
  static const double PADDING_14 = 14.0;
  static const double PADDING_12 = 12.0;
  static const double PADDING_10 = 10.0;
  static const double PADDING_8 = 8.0;
  static const double PADDING_4 = 4.0;
  static const double PADDING_2 = 2.0;
  static const double PADDING_0 = 0.0;

  //Radius
  static const double RADIUS_80 = 80.0;
  static const double RADIUS_70 = 70.0;
  static const double RADIUS_60 = 60.0;
  static const double RADIUS_40 = 40.0;
  static const double RADIUS_32 = 32.0;
  static const double RADIUS_30 = 30.0;
  static const double RADIUS_24 = 24.0;
  static const double RADIUS_22 = 22.0;
  static const double RADIUS_20 = 20.0;
  static const double RADIUS_18 = 18.0;
  static const double RADIUS_16 = 16.0;
  static const double RADIUS_14 = 14.0;
  static const double RADIUS_12 = 12.0;
  static const double RADIUS_10 = 10.0;
  static const double RADIUS_8 = 8.0;
  static const double RADIUS_6 = 6.0;
  static const double RADIUS_4 = 4.0;
  static const double RADIUS_0 = 0.0;

  //Elevations
  static const double ELEVATION_16 = 16.0;
  static const double ELEVATION_14 = 14.0;
  static const double ELEVATION_12 = 12.0;
  static const double ELEVATION_10 = 10.0;
  static const double ELEVATION_8 = 8.0;
  static const double ELEVATION_6 = 6.0;
  static const double ELEVATION_4 = 4.0;
  static const double ELEVATION_2 = 2.0;
  static const double ELEVATION_0 = 0.0;
}

class Gradients {
  static const Gradient primaryGradient = LinearGradient(
    begin: Alignment(0.5, 1),
    end: Alignment(0.51711, -0.06443),
    stops: [
      0,
      1,
    ],
    colors: [
      Color.fromARGB(0, 255, 255, 255),
      Color.fromARGB(66, 0, 0, 0),
    ],
  );
  static const Gradient secondaryGradient = LinearGradient(
    begin: Alignment(0.9661, 0.5),
    end: Alignment(0, 0.5),
    stops: [
      0,
      1,
    ],
    colors: [
      Color.fromARGB(255, 255, 86, 115),
      Color.fromARGB(255, 255, 140, 72),
    ],
  );

  static const Gradient secondaryGradient2 = LinearGradient(
    begin: Alignment(0, 1.0),
    end: Alignment(1.0, 0.5),
    stops: [
      0,
      1,
    ],
    colors: [
      Color.fromARGB(255, 255, 174, 139),
      Color.fromARGB(255, 255, 150, 159),
    ],
  );
  static const Gradient fullScreenOverGradient = LinearGradient(
    begin: Alignment(0.51436, 1.07565),
    end: Alignment(0.51436, -0.03208),
    stops: [
      0,
      0.25098,
      1,
    ],
    colors: [
      Color.fromARGB(255, 0, 0, 0),
      Color.fromARGB(255, 17, 17, 17),
      Color.fromARGB(105, 45, 45, 45),
    ],
  );

  static const Gradient footerOverlayGradient = LinearGradient(
    begin: Alignment(0.51436, 1.07565),
    end: Alignment(0.51436, -0.03208),
    stops: [
      0,
      0.17571,
      1,
    ],
    colors: [
      Color.fromARGB(255, 0, 0, 0),
      Color.fromARGB(255, 8, 8, 8),
      Color.fromARGB(105, 45, 45, 45),
    ],
  );

  static const Gradient restaurantDetailsGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromRGBO(0, 0, 0, 0.39),
      Color.fromRGBO(255, 255, 255, 0),
      Color.fromRGBO(0, 0, 0, 0.43),
//      Color.fromARGB(105, 45, 45, 45),
//      Color(0x00000000),
//      Color(0xFFFFFFff),
//      Color(0x0000006E),
    ],
  );
  static const Gradient italianGradient = LinearGradient(
    colors: [
      Color(0xFFFF5673),
      Color(0xFFFF8C48),
    ],
  );
  static const Gradient chineseGradient = LinearGradient(
    colors: [
      Color(0xFFFF4665),
      Color(0xFF832BF6),
    ],
  );
  static const Gradient mexicanGradient = LinearGradient(
    colors: [
      Color(0xFF3B40FE),
      Color(0xFF2DCEF8),
    ],
  );
  static const Gradient thaiGradient = LinearGradient(
    colors: [
      Color(0xFF009DC5),
      Color(0xFF21E590),
    ],
  );
  static const Gradient arabianGradient = LinearGradient(
    colors: [
      Color(0xFFFF870E),
      Color(0xFFD236D2),
    ],
  );
  static const Gradient indianGradient = LinearGradient(
    colors: [
      Color(0xFF5C51FF),
      Color(0xFFFE327E),
    ],
  );
  static const Gradient americanGradient = LinearGradient(
    colors: [
      Color(0xFF2CE3F1),
      Color(0xFF6143FF),
    ],
  );
  static const Gradient koreanGradient = LinearGradient(
    colors: [
      Color(0xFFFF8C48),
      Color(0xFFFF5673),
    ],
  );
}

List<Gradient> gradients = [
  Gradients.italianGradient,
  Gradients.chineseGradient,
  Gradients.mexicanGradient,
  Gradients.thaiGradient,
  Gradients.arabianGradient,
  Gradients.indianGradient,
  Gradients.americanGradient,
  Gradients.koreanGradient,
];

class AppColors {
  static const Color primaryColor =
      Color.fromARGB(255, 255, 255, 255); //Color(0xFFFFFFFF)
  static const Color secondaryColor = Color.fromARGB(255, 246, 247, 255);
  static const Color ternaryBackground = Color.fromARGB(255, 238, 247, 255);
  static const Color primaryElement = Color.fromARGB(255, 255, 255, 255);
  static const Color secondaryElement = Color.fromARGB(255, 86, 99, 255);
  static const Color accentElement = Color.fromARGB(255, 186, 192, 203);
  static const Color primaryText = Color.fromARGB(255, 62, 63, 104);
  static const Color secondaryText = Color.fromARGB(255, 255, 255, 255);
  static const Color accentText = Color.fromARGB(255, 110, 127, 170);
  static const Color headingText = Color.fromARGB(255, 34, 36, 85);

  static const Color fillColor = Color.fromARGB(57, 255, 255, 255);
  static const Color fillColors = Color.fromARGB(0, 183, 190, 210);
  static const Color kFoodyBiteGreen = Color.fromRGBO(76, 217, 100, 1);
  static const Color kFoodyBiteYellow = Color(0xFFFFCC00);
//  static const Color kFoodyBiteGoldRatingStar = Color(0xFFFFCC00);
  static const Color kFoodyBiteGreyRatingStar = Color(0xFFDFE4ED);
  static const Color kFoodyBiteSkyBlue = Color(0xFFEEF7FF);
  static const Color kFoodyBiteDarkBackground = Color(0xFF25262E);
  static const Color kFoodyBiteUnselectedSliderDot = Color(0xFF6A6A6A);

  static const Color iconColor = Color.fromRGBO(17, 75, 95, 0.6);
  static const Color errorColor = Color(0xFFB00020);

  //Black
  static const Color black = Color(0xFF000000);

  //White
  static const Color white = Color(0xFFFFFFFF);
  static const Color whiteShade_50 = Color.fromRGBO(255, 255, 255, 0.51);

  //grey
  static const Color grey = Color(0xFFA1A1A1);
  static const Color greyShade1 = Color(0xFFE8E8E8);
  //indigo
  static const Color indigo = Color(0xFF8A98BA);
  static const Color indigoShade1 = Color.fromRGBO(34, 36, 85, 0.5);
  //purple
  static const Color purple = Color(0xFFF6F7FF);
  static const Color purpleShade1 = Color(0xFFE6E7FF);
  //green
  static const Color green = Color(0xFF4CD964);
}

class Styles {
  static const TextStyle titleTextStyleWithSecondaryTextColor = TextStyle(
    color: AppColors.secondaryText,
    fontFamily: StringConst.FONT_FAMILY,
    fontWeight: FontWeight.w700,
    fontSize: Sizes.TEXT_SIZE_40,
  );

  static TextStyle customTitleTextStyle({
    Color color = AppColors.secondaryText,
    String fontFamily = StringConst.FONT_FAMILY,
    FontWeight fontWeight = FontWeight.w700,
    double fontSize = Sizes.TEXT_SIZE_40,
    double letterSpacing = 0,
  }) {
    return TextStyle(
      color: color,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontSize: fontSize,
      letterSpacing: letterSpacing,
    );
  }

  static const TextStyle normalTextStyle = TextStyle(
    color: AppColors.secondaryText,
    fontFamily: StringConst.FONT_FAMILY,
    fontWeight: FontWeight.w400,
    fontSize: Sizes.TEXT_SIZE_16,
  );

  static const TextStyle foodyBiteTitleTextStyle = TextStyle(
    color: AppColors.headingText,
    fontFamily: StringConst.FONT_FAMILY,
    fontWeight: FontWeight.w400,
    fontSize: Sizes.TEXT_SIZE_20,
  );

  static const TextStyle foodyBiteSubtitleTextStyle = TextStyle(
    color: AppColors.accentText,
    fontFamily: StringConst.FONT_FAMILY,
    fontWeight: FontWeight.w400,
    fontSize: Sizes.TEXT_SIZE_14,
  );

  static TextStyle customNormalTextStyle({
    Color color = AppColors.secondaryText,
    String fontFamily = StringConst.FONT_FAMILY,
    FontWeight fontWeight = FontWeight.w400,
    double fontSize = Sizes.TEXT_SIZE_16,
    double letterSpacing = 0,
  }) {
    return TextStyle(
      color: color,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontSize: fontSize,
      letterSpacing: letterSpacing,
    );
  }

  static const TextStyle mediumTextStyle = TextStyle(
    color: AppColors.secondaryText,
    fontFamily: StringConst.FONT_FAMILY,
    fontWeight: FontWeight.w400,
    fontSize: Sizes.TEXT_SIZE_20,
  );

  static TextStyle customMediumTextStyle({
    Color color = AppColors.secondaryText,
    String fontFamily = StringConst.FONT_FAMILY,
    FontWeight fontWeight = FontWeight.w400,
    double fontSize = Sizes.TEXT_SIZE_20,
    FontStyle fontStyle: FontStyle.normal,
    double letterSpacing = 0,
  }) {
    return TextStyle(
      color: color,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontSize: fontSize,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
    );
  }
}

class StringConst {
  //Font Family
  static const String FONT_FAMILY = "Josefin Sans";
}
