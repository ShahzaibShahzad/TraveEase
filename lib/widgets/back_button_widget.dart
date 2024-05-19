import 'package:flutter/material.dart';
import 'package:utility_extensions/utility_extensions.dart';

import '../extras/colors.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({this.color, Key? key}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: const BoxConstraints(),
      padding: EdgeInsets.zero,
      onPressed: () {
        context.pop();
      },
      icon: const Icon(
        Icons.arrow_back_ios_new,
      ),
      color: color ?? CColors.primary,
    );
  }
}
