import 'dart:core';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:utility_extensions/utility_extensions.dart';
import '../extras/app_textstyle.dart';
import '../extras/colors.dart';
import '../generated/assets.dart';
import '../models/stay_model.dart';
import '../screens/dashboard/home/stays_screen.dart';
import 'margin_widget.dart';

class SaveStaysWidget extends StatelessWidget {
  // final String titleText, image;
  // final double price;

  SaveStaysWidget({
    required this.model,
    Key? key,
    // required this.titleText,
    // required this.image,
    // required this.price,
  }) : super(key: key);
  StayModel model;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        context.push(child:  StaysScreen(model: model,));
      },
      child: SizedBox(
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: model.images!.isNotEmpty ? DecorationImage(
                  image: NetworkImage(model.images!.first),
                  fit: BoxFit.cover,
                ) :  const DecorationImage(
                  image:  AssetImage(Assets.placeholder1),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: width * 0.05,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      model.title!,
                      style: AppTextStyle.cobblerSans(
                        color: CColors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const VMarginWidget(
                      factor: 0.09,
                    ),
                    Text(
                      DateFormat.yMMMMd().format(model.timePosted!),
                      style:  AppTextStyle.cobblerSans(
                          fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    const VMarginWidget(
                      factor: 0.09,
                    ),
                    // Text("${model.price}/person",
                    //   style: AppTextStyle.urbanist(
                    //     style: const TextStyle(
                    //       fontSize: 12,
                    //       fontWeight: FontWeight.w400,
                    //     ),
                    //   ),
                    // ),
                    rowWidget(
                        "26 \$",
                        "/person"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rowWidget(String str1, String str2) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          str1,
          style: AppTextStyle.cobblerSans(
              fontSize: 12,
              fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          str2,
          textAlign: TextAlign.end,
          style: AppTextStyle.cobblerSans(
              fontSize: 12,
              fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
