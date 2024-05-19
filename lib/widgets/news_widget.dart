import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_book/extras/app_textstyle.dart';
import 'package:travel_book/extras/colors.dart';
import 'package:travel_book/generated/assets.dart';
import 'package:travel_book/widgets/margin_widget.dart';
import 'package:travel_book/widgets/primary_button_widget.dart';
import 'package:utility_extensions/utility_extensions.dart';

import '../models/news_model.dart';
import '../screens/dashboard/home/news_screen.dart';

class NewsWidget extends StatelessWidget {
  NewsWidget({required this.model, Key? key}) : super(key: key);
  NewsModel model;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          12,
        ),
        child: AspectRatio(
          aspectRatio: 2.17,
          child: Stack(
            children: [
              if (model.images.isNotEmpty) ...[
                Image(
                  image: NetworkImage(
                    model.images.first,
                  ),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ] else ...[
                const Image(
                  image: AssetImage(Assets.placeholder1),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ],
              Positioned.fill(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.03,
                    vertical: height * 0.025,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                    color: Colors.black.withOpacity(
                      0.2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model.time,
                              style: AppTextStyle.cobblerSans(
                                color: CColors.white,
                                fontSize: 12,
                              ),
                            ),
                            const VMarginWidget(
                              factor: 0.2,
                            ),
                            Text(
                              model.title,
                              style: AppTextStyle.cobblerSans(
                                  color: CColors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600,
                              ),
                            ),
                            const VMarginWidget(
                              factor: 1,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 39,
                        width: 129,
                        child: PrimaryButton(
                          text: "Explore Now".tr,
                          onPressed: () {
                            context.push(
                              child: NewsScreen(
                                model: model,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
