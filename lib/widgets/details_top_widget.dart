import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:iconly/iconly.dart';
import 'package:travel_book/widgets/back_button_widget.dart';
import 'package:travel_book/widgets/margin_widget.dart';
import 'package:utility_extensions/utility_extensions.dart';
import '../extras/app_textstyle.dart';
import '../extras/colors.dart';
import 'carousel_widget.dart';

class DetailsTopWidget extends StatelessWidget {
  DetailsTopWidget(
      {required this.images,
      required this.rating,
      Key? key,
      this.ratingShow = true,
      required this.onTap,
      required this.isCheck,
      required this.onpress})
      : super(key: key);

  late bool ratingShow;
  final List<String> images;
  final double rating;
  final Function() onTap;
  final Function() onpress;
  bool isCheck;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return AspectRatio(
      aspectRatio: 1.25,
      child: Stack(
        children: [
          CarouselWidget(
            images: images,
          ),
          Positioned.fill(
            child: Container(
              padding: EdgeInsets.only(top: context.topPadding),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        const VMarginWidget(
                          factor: 0.5,
                        ),
                        BackButtonWidget(
                          color: CColors.white,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const VMarginWidget(
                          factor: 0.5,
                        ),
                        if(ratingShow)...[
                          Container(
                            height: 40,
                            width: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: CColors.primary,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              rating.toStringAsFixed(
                                1,
                              ),
                              style: AppTextStyle.urbanist(
                                style: TextStyle(
                                  color: CColors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const VMarginWidget(
                            factor: 0.5,
                          ),
                        ],
                        blurButton(
                          iconData: isCheck
                              ? IconlyBold.bookmark
                              : IconlyLight.bookmark,
                          onTap: onTap,
                        ),
                        const VMarginWidget(
                          factor: 0.5,
                        ),
                        blurButton(
                          iconData: FeatherIcons.share2,
                          onTap: onpress,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget blurButton({required IconData iconData, required Function() onTap}) {
  return InkWell(
    onTap: onTap,
    child: GlassContainer.clearGlass(
      height: 40,
      width: 40,
      blur: 5,
      shape: BoxShape.circle,
      borderWidth: 0,
      child: Icon(
        iconData,
        color: CColors.white,
      ),
    ),
  );
}
