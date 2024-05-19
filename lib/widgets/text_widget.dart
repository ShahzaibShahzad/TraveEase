import 'package:flutter/material.dart';

import '../extras/app_textstyle.dart';
import '../extras/colors.dart';
class TextWidget extends StatelessWidget {
  TextWidget({required this.text,  Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyle.cobblerSans(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: CColors.black,
      ),
    );
  }
}