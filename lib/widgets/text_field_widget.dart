import 'package:flutter/material.dart';
import 'package:travel_book/extras/app_textstyle.dart';
import '../extras/colors.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final String label;
  final bool isLast;
  final bool readOnly;

  void Function(String?)? onChanged;

  TextFieldWidget(
      {Key? key,
      required this.controller,
      required this.label,
      this.isLast = false,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.readOnly = false,
      this.onChanged})
      : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool obscureText = false;

  @override
  void initState() {
    obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: obscureText,
      readOnly: widget.readOnly,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      textInputAction:
          widget.isLast ? TextInputAction.done : TextInputAction.next,
      decoration: InputDecoration(
        hintStyle: AppTextStyle.cobblerSans(
          
        ),
        isDense: true,
        labelText: widget.label,
        suffixIcon: !widget.obscureText
            ? null
            : IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                icon: const Icon(Icons.ac_unit

                ),
                color: CColors.black,
              ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(
            color: CColors.primary,
          ),
        ),
        // labelStyle: AppTextStyle.urbanist(
        //   style: TextStyle(
        //     color: CColors.grey2,
        //     fontSize: 14,
        //   )
        // ),
        floatingLabelStyle:
            MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
          final Color color = states.contains(MaterialState.focused)
              ? CColors.primary
              : CColors.grey2;
          return AppTextStyle.urbanist(
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          );
        }),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(
            color: CColors.grey2,
          ),
        ),
      ),
    );
  }
}
