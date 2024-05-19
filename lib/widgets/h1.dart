import 'package:flutter/material.dart';

import 'heading_widget.dart';

Widget h1(text, padding, {Color color = Colors.black}) {
  return Container(
    padding: padding,
    child: HeadingWidget(
      text: text,
      color: color,
    ),
  );
}
