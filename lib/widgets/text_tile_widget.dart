import 'package:flutter/material.dart';
import '../extras/app_textstyle.dart';
import '../extras/colors.dart';

class TextTileWidget extends StatelessWidget {
  const TextTileWidget({required this.text,
    this.onPressed,
    this.fontWeight = FontWeight.normal,
    this.trailingIcon,
    Key? key}) : super(key: key);

  final String text;
  final FontWeight fontWeight;

  final IconData? trailingIcon;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      dense: true,
      minVerticalPadding: 0,
      visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
      contentPadding: EdgeInsets.zero,
      title: Text(
        text,
        style: AppTextStyle.urbanist(
          style: TextStyle(
            color: CColors.black,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
      trailing: Icon(
        trailingIcon ?? Icons.arrow_forward_ios,
        color: CColors.grey3,
        size: 15,
      ),
    );
  }
}
