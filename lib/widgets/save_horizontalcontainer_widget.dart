import 'package:flutter/material.dart';
import '../extras/app_textstyle.dart';
import '../extras/colors.dart';

class SaveContainerWidget extends StatefulWidget {
  final String text;
  final String selectedText;

  final Function(String) onTap;

  const SaveContainerWidget({
    Key? key,
    required this.text,
    required this.selectedText,
    required this.onTap,
  }) : super(key: key);

  @override
  State<SaveContainerWidget> createState() => _SaveContainerWidgetState();
}

class _SaveContainerWidgetState extends State<SaveContainerWidget> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    isCheck = widget.text == widget.selectedText;
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 2),
      ),
      onPressed: () {
        widget.onTap(widget.text);
      },
      child: Container(
        height: 36,
        width: 102,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: isCheck ? null : Border.all(width: 1, color: CColors.grey2),
          color: isCheck ? CColors.primary : null,
        ),
        child: Center(
          child: Text(
            widget.text,
            style: AppTextStyle.cobblerSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: isCheck ? CColors.white : CColors.black),
          ),
        ),
      ),
    );
  }
}
