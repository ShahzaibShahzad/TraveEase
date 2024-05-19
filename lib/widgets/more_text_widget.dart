import 'package:flutter/material.dart';

import '../extras/app_textstyle.dart';
import '../extras/colors.dart';

class MoreTextWidget extends StatelessWidget {

  const MoreTextWidget({required this.text, Key? key}) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5,),
      child: Row(
        children: [
          Icon(
            Icons.circle,
            color: CColors.primary,
            size: 12,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(text,
              style: AppTextStyle.urbanist(
                style: TextStyle(
                  color: CColors.black,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
