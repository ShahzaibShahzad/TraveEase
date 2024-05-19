import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:travel_book/extras/constant.dart';
import 'package:travel_book/widgets/margin_widget.dart';
import '../models/user_model.dart';
import '../extras/app_textstyle.dart';
import '../extras/colors.dart';
import '../generated/assets.dart';
import '../models/review_model.dart';

class ReviewWidget extends StatelessWidget {
  ReviewWidget({required this.model, Key? key}) : super(key: key);
  ReviewModel model;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;



    return Container(
      margin: EdgeInsets.symmetric(
        vertical: height * 0.015,
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipOval(
                child: Image(
                  image:NetworkImage(Constants.tourImage) as ImageProvider,
                  width: 40,
                  height: 40,
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.03,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "name",
                              style: AppTextStyle.cobblerSans(
                                color: CColors.black,
                                fontSize: 12,
                              ),
                            ),
                            RatingBarIndicator(
                              rating: model.rating,
                              unratedColor: CColors.yellow.withOpacity(
                                0.5,
                              ),
                              itemBuilder: (context, index) => Icon(
                                IconlyBold.star,
                                color: CColors.yellow,
                              ),
                              itemCount: 5,
                              itemSize: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      DateFormat("dd MMMM yyyy").format(
                          DateTime.fromMillisecondsSinceEpoch(
                              model.date)),
                      style: AppTextStyle.cobblerSans(
                        color: CColors.grey4,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const VMarginWidget(
            factor: 0.5,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              model.comment,
              style: AppTextStyle.cobblerSans(
                fontSize: 12,
                color: CColors.black,
              ),
            ),
          )
        ],
      ),
    );

  }
}
