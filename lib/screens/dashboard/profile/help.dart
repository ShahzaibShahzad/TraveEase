import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:travel_book/providers/data_provider.dart';
import 'package:travel_book/widgets/back_button_widget.dart';
import 'package:travel_book/widgets/heading_widget.dart';
import 'package:travel_book/widgets/margin_widget.dart';
import 'package:utility_extensions/utility_extensions.dart';

import '../../../extras/app_textstyle.dart';
import '../../../extras/colors.dart';
import '../../../widgets/divider_widget.dart';
import '../../../widgets/text_tile_widget.dart';
import '../../../widgets/widget_slides.dart';
import 'help_questions.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  String selectedText = "Tours".tr;
  late double width;
  late DataProvider provider;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Consumer<DataProvider>(
      builder: (context, value, child) {
        provider = value;
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VMarginWidget(
                    factor: 2,
                  ),
                  const BackButtonWidget(),
                  const VMarginWidget(
                    factor: 0.5,
                  ),
                  Text(
                    'FAQ'.tr,
                    style: AppTextStyle.urbanist(
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: CColors.grey4,
                      ),
                    ),
                  ),
                  const VMarginWidget(
                    factor: 0.2,
                  ),
                  HeadingWidget(
                    text: "Help Center".tr,
                  ),
                  const VMarginWidget(
                    factor: 0.6,
                  ),
                  SlideWidget(
                      onTap: (val) {
                        setState(() {
                          selectedText = val;
                        });
                      },
                      selectedText: selectedText),
                  const VMarginWidget(
                    factor: 0.7,
                  ),
                  Text(
                    'TOP QUESTIONS'.tr,
                    style: AppTextStyle.urbanist(
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: CColors.grey4,
                      ),
                    ),
                  ),
                  TextTileWidget(
                    text: 'Coronavirus-related support',
                    onPressed: () {
                      goNext("Coronavirus-related support");
                    },
                  ),
                  const DividerWidget(),
                  TextTileWidget(
                    text: 'Cancellations',
                    onPressed: (){
                      goNext("Cancellations");
                    },
                  ),
                  const DividerWidget(),
                  TextTileWidget(text: 'Payment',
                      onPressed: (){
                        goNext("Payment");
                      }
                  ),
                  const DividerWidget(),
                  TextTileWidget(text: 'Booking details',
                      onPressed: (){
                        goNext("Booking details");
                      }
                  ),
                  const DividerWidget(),
                  const VMarginWidget(
                    factor: 0.5,
                  ),
                  Text(
                    'FAQ OTHER'.tr,
                    style: AppTextStyle.urbanist(
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: CColors.grey4,
                      ),
                    ),
                  ),
                  TextTileWidget(text: 'Communications',
                      onPressed: (){
                        goNext("Communications");
                      }
                  ),
                  const DividerWidget(),
                  TextTileWidget(text: 'Pricing',
                      onPressed: (){
                        goNext("Pricing");
                      }
                  ),
                  const DividerWidget(),
                  TextTileWidget(text: 'Security and awareness',
                      onPressed: (){
                        goNext("Security and awareness");
                      }
                  ),
                  const DividerWidget(),
                  // const TextTileWidget(text: 'Lorem ipsum dolor sit'),
                  // const DividerWidget(),
                  // const TextTileWidget(text: 'Lorem ipsum dolor asum dat  '),
                  // const DividerWidget(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  goNext(String type) {
    context.push(child: HelpQuestions(type: type));
  }

}
