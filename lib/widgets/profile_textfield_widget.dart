import 'package:flutter/material.dart';
import 'package:travel_book/extras/app_textstyle.dart';
import '../extras/colors.dart';
class ProfileTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hint;

  final bool readOnly;
  const ProfileTextFieldWidget({Key? key,
    required this.hint,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: controller,
      keyboardType: keyboardType,
      readOnly: readOnly,
      decoration:  InputDecoration(
        fillColor: CColors.grey2,
        filled: true,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        hintText: hint,
        hintStyle: AppTextStyle.urbanist(
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: CColors.grey4
          ),
        ),
      ),

    );
  }
}
