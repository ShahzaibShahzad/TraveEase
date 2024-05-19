import 'package:flutter/material.dart';

import '../extras/colors.dart';

class RichBoldWidget extends StatelessWidget {
  RichBoldWidget({required this.boldText, required this.normalText,this.color, Key? key}) : super(key: key);
  final String boldText;
  final String normalText;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return  RichText(
      text:  TextSpan(
        children:  [
          TextSpan(text: boldText,
              style: TextStyle(fontWeight: FontWeight.bold,color: CColors.black)),
          TextSpan(text: normalText ,
              style: TextStyle(color:color)
          ),
        ],
      ),
    );
  }
}