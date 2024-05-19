import 'package:flutter/material.dart';

import '../extras/app_textstyle.dart';
import '../extras/colors.dart';

class PrimaryButton extends StatelessWidget {
  final String text;

  final Function()? onPressed;

  const PrimaryButton({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      onPressed: onPressed,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: CColors.primary,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Center(
            child: Text(
          text,
          style: AppTextStyle.urbanist(
            style: TextStyle(
              color: CColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        )),
      ),
    );
  }
}
