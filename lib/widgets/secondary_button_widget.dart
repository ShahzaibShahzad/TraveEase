import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../extras/app_textstyle.dart';
import '../extras/colors.dart';

class SecondaryButton extends StatelessWidget {
  final String text;

  final Function()? onPressed;

  const SecondaryButton({
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
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: CColors.grey2),
        ),
        child: Center(
          child: Text(
            'Create account'.tr,
            style: AppTextStyle.urbanist(
              style: TextStyle(
                fontSize: 16,
                color: CColors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
