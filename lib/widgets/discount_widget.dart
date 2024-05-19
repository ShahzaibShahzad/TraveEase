import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_book/extras/app_textstyle.dart';
import 'package:travel_book/extras/colors.dart';
import 'package:travel_book/generated/assets.dart';

import 'primary_button_widget.dart';

class DiscountWidget extends StatelessWidget {
  const DiscountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var padding = EdgeInsets.symmetric(horizontal: width * 0.03, vertical: height * 0.01,);
    return AspectRatio(
      aspectRatio: 3.2143,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          12,
        ),
        child: Stack(
          children: [
            const Image(
              image: AssetImage(Assets.imagesDiscount),
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              padding: padding,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(
                  0.2,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Get flat".tr,
                    style: AppTextStyle.urbanist(
                      style: TextStyle(
                        color: CColors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 10,),
                                    child: Text("20",
                                      style: AppTextStyle.anton(
                                        style: TextStyle(
                                          color: CColors.red,
                                          fontSize: 56,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    bottom: 10,
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        color: CColors.grey.withOpacity(0.5,),
                                        shape: BoxShape.circle,
                                      ),
                                      child: ImageIcon(
                                        AssetImage(Assets.iconsPercentage,),
                                        color: CColors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Container(
                                margin: const EdgeInsets.only(bottom: 10, left: 10,),
                                child: Text("Discount".tr,
                                  style: AppTextStyle.urbanist(
                                    style: TextStyle(
                                      color: CColors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 130,
                          height: 39,
                          child: PrimaryButton(
                            text: "Get Now".tr,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
