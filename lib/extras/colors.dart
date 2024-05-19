import 'package:flutter/material.dart';

class CColors{

  static Color primary = const Color(0xffE95454);

  static Color red = const Color(0xffe95454);

  static Color blue = const Color(0xff32acf8);
  static Color yellow = const Color(0xffFFC451);
  static Color green = const Color(0xff20bc9e);
  static Color black = const Color(0xff232323);
  static Color grey = const Color(0xffececec);
  static Color grey2 = const Color(0xffdbdbdb);
  static Color grey3 = const Color(0xffb2b2b2);
  static Color grey4 = const Color(0xff6b6b6b);
  static Color white = const Color(0xffFFFFFF);
  static Color blue1 = const Color(0xff386FAE);





  static MaterialColor getMaterialColor() {
    return MaterialColor(primary.value, CColors.getSwatch(primary));
  }

  static Map<int, Color> getSwatch(Color color) {
    final hslColor = HSLColor.fromColor(color);
    final lightness = hslColor.lightness;
    const lowDivisor = 6;
    const highDivisor = 5;
    final lowStep = (1.0 - lightness) / lowDivisor;
    final highStep = lightness / highDivisor;
    return {
      50: (hslColor.withLightness(lightness + (lowStep * 5))).toColor(),
      100: (hslColor.withLightness(lightness + (lowStep * 4))).toColor(),
      200: (hslColor.withLightness(lightness + (lowStep * 3))).toColor(),
      300: (hslColor.withLightness(lightness + (lowStep * 2))).toColor(),
      400: (hslColor.withLightness(lightness + lowStep)).toColor(),
      500: (hslColor.withLightness(lightness)).toColor(),
      600: (hslColor.withLightness(lightness - highStep)).toColor(),
      700: (hslColor.withLightness(lightness - (highStep * 2))).toColor(),
      800: (hslColor.withLightness(lightness - (highStep * 3))).toColor(),
      900: (hslColor.withLightness(lightness - (highStep * 4))).toColor(),
    };
  }
}