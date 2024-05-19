import 'package:flutter/material.dart';
import 'package:travel_book/models/faq_model.dart';
import 'package:travel_book/widgets/margin_widget.dart';
import 'package:travel_book/widgets/text_tile_widget.dart';

import '../extras/app_textstyle.dart';
import '../extras/colors.dart';

class FaqWidget extends StatefulWidget {
  final FAQModel faqModel;

  const FaqWidget({super.key, required this.faqModel});

  @override
  _FaqWidgetState createState() => _FaqWidgetState();
}

class _FaqWidgetState extends State<FaqWidget> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isVisible = !isVisible;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.faqModel.question,
                    style: AppTextStyle.urbanist(
                      style: TextStyle(
                        color: CColors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Icon(
                  isVisible == false ? Icons.arrow_forward_ios_rounded : Icons.keyboard_arrow_down_outlined,
                  size: isVisible == false ? 20 : 35,
                  color: CColors.black,
                )
              ],
            ),
          ),
        ),
        Visibility(
          visible: isVisible,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.faqModel.answer,
              style: AppTextStyle.urbanist(
                style: TextStyle(
                  color: CColors.black,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
