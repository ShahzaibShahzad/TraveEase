import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:utility_extensions/utility_extensions.dart';

import '../extras/colors.dart';
import '../screens/dashboard/profile/cookie_Policy.dart';
class RichTextTab extends StatelessWidget {
  RichTextTab({required this.text, required this.tabText,this.color, this.textThree});
  final String text;
  final String tabText;
 final textThree;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(
      children:  [
        TextSpan(text: text,
            style: TextStyle(color: CColors.black)),
        TextSpan(text: tabText ,
            style: TextStyle(color:CColors.primary),
            recognizer: TapGestureRecognizer()
              ..onTap = (){
                context.push(child: CookiePolicy());
              }
        ),
        TextSpan(text: textThree,
            style: TextStyle(color: CColors.black)),
      ],
    ),
    );
  }
}
