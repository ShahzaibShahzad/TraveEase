import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle{
  static TextStyle urbanist({TextStyle? style}){
    return GoogleFonts.urbanist(textStyle: style);
  }

  static TextStyle cobblerSans(
      {double? fontSize, FontWeight? fontWeight, Color? color}) {
    var textStyle = TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        fontFamily: "Cobbler");
    return textStyle;
  }
  static TextStyle anton({TextStyle? style}){
    return GoogleFonts.anton(textStyle: style);
  }
}