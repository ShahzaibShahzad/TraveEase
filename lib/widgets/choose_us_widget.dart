import 'package:flutter/material.dart';

import '../extras/app_textstyle.dart';
import '../extras/colors.dart';
import '../generated/assets.dart';
import 'margin_widget.dart';
class ChooseUsWidget extends StatelessWidget {
   ChooseUsWidget({Key? key}) : super(key: key);

   late double width, height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: CColors.grey,
                  borderRadius: BorderRadius.circular(6)
                ),
                child:   Padding(
                  padding:  EdgeInsets.symmetric(vertical: height * 0.03),
                  child: ImageIcon(
                    const AssetImage(
                      Assets.like ,
                    ),size: 60,color: CColors.primary,
                  ),
                ),
              ),
            ),
            const HMarginWidget(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: CColors.grey,
                    borderRadius: BorderRadius.circular(6)
                ),
                child:  Padding(
                  padding:  EdgeInsets.symmetric(vertical: height*0.03),
                  child: ImageIcon(
                    const AssetImage(
                      Assets.check ,
                    ),size: 60,
                    color: CColors.primary,
                  ),
                ),
              ),
            ),
            const HMarginWidget(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: CColors.grey,
                    borderRadius: BorderRadius.circular(6)
                ),
                child:  Padding(
                  padding:  EdgeInsets.symmetric(vertical: height * 0.03),
                  child: ImageIcon(
                    const AssetImage(
                      Assets.watch ,
                    ),size: 60,
                    color: CColors.primary,
                  ),
                ),
              ),
            ),

          ],
        ),
        const VMarginWidget(factor: 0.5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "Customer \n experience",
                  style: AppTextStyle.cobblerSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
            ),
            const HMarginWidget(),
            Expanded(
              child: Center(
                child: Text(
                  "Full service",
                  style: AppTextStyle.cobblerSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
            ),
            const HMarginWidget(),
            Expanded(
              child: Center(
                child: Text(
                  "24/7 support",
                  style: AppTextStyle.cobblerSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
