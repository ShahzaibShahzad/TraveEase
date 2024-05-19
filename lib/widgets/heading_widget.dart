
import 'package:flutter/material.dart';
import '../extras/app_textstyle.dart';
import '../extras/colors.dart';

class HeadingWidget extends StatelessWidget {
   HeadingWidget({required this.text, this.color, this.fontSize = 21, Key? key}) : super(key: key);

  final String text;
  final double fontSize;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyle.cobblerSans(
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
          color: color ?? CColors.black,
      ),
    );
  }
}



