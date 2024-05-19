import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_book/widgets/save_horizontalcontainer_widget.dart';

import '../extras/app_textstyle.dart';
import '../extras/colors.dart';
import 'margin_widget.dart';

class SlideWidget extends StatefulWidget {
  void Function(String) onTap;
  String selectedText;

  SlideWidget({super.key, required this.onTap, required this.selectedText});

  @override
  State<SlideWidget> createState() => _SlideWidgetState();
}

class _SlideWidgetState extends State<SlideWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SaveContainerWidget(
                text: "Tours".tr,
                selectedText: widget.selectedText,
                onTap: widget.onTap,
                // onTap: (val) {
                //   setState(() {
                //     selectedText = val;
                //   });
                // },
              ),
              SaveContainerWidget(
                text: "Stays".tr,
                selectedText: widget.selectedText,
                onTap: widget.onTap,
              ),
              SaveContainerWidget(
                text: "Blog".tr,
                selectedText: widget.selectedText,
                onTap: widget.onTap,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
