import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:travel_book/extras/app_textstyle.dart';
import 'package:travel_book/extras/colors.dart';
import 'package:utility_extensions/utility_extensions.dart';
import '../generated/assets.dart';
import '../models/tour_model.dart';
import '../providers/data_provider.dart';
import '../screens/dashboard/home/tour_screen.dart';
import 'margin_widget.dart';

class TourTicketWidget extends StatelessWidget {
  TourTicketWidget({required this.index, required this.model, Key? key})
      : super(key: key);
  TourModel model;
  final int index;

  late double width, height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Consumer<DataProvider>(builder: (context, value, child) {
      return AspectRatio(
        aspectRatio: 0.8,
        child: InkWell(
          onTap: () {
            context.push(
                child: TourScreen(
              model: model,
            ));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              12,
            ),
            child: Stack(
              children: [
                if (model.images!.isEmpty) ...[
                  const Image(
                    image: AssetImage(Assets.placeholder1),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  )
                ] else ...[
                  Image(
                    image: NetworkImage(model.images!.first),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ],
                Positioned.fill(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.015,
                      vertical: height * 0.01,
                    ),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.black,
                        ],
                        stops: [
                          0.75,
                          1.0,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: FloatingActionButton(
                              heroTag: model.id,
                              onPressed: () {
                              },
                              backgroundColor: CColors.white,
                              child: Icon(IconlyLight.bookmark,
                                color:CColors.grey3,
                                size: 10,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model.title!,
                              maxLines: 2,
                              style: AppTextStyle.cobblerSans(
                                  color: CColors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                              ),
                            ),
                            const VMarginWidget(
                              factor: 0.1,
                            ),
                            Row(
                              children: [
                                Text(
                                  "${"from".tr} ",
                                  style: AppTextStyle.cobblerSans(
                                    color: CColors.white,
                                    fontSize: 11,
                                  ),
                                ),
                                Text(
                                  "${model.price != null? model.price!.toInt() : 0} \$",
                                  style: AppTextStyle.cobblerSans(
                                    color: CColors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                              ],
                            ),
                          ],
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
    });
  }
}
