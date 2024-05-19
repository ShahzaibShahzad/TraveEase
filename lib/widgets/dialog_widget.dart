import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:travel_book/models/review_model.dart';
import 'package:travel_book/widgets/primary_button_widget.dart';
import 'package:travel_book/widgets/text_field_widget.dart';
import 'package:utility_extensions/utility_extensions.dart';
import 'package:uuid/uuid.dart';
import '../extras/app_textstyle.dart';
import '../extras/colors.dart';
import '../extras/functions.dart';
import 'margin_widget.dart';

class RatingDialog extends StatefulWidget {
  RatingDialog({Key? key}) : super(key: key);

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  late double width, height;
  var review = TextEditingController();
  double rating = 0.0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const VMarginWidget(),
          Text(
            "Show Something",
            style: AppTextStyle.urbanist(
              style: TextStyle(
                fontSize: 19,
                color: CColors.grey4,
              ),
            ),
          ),
          const VMarginWidget(),
          const VMarginWidget(),
          RatingBar.builder(
            initialRating: 0,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, i) => Icon(
              IconlyBold.star,
              color: rating > i
                  ? CColors.yellow
                  : CColors.yellow.withOpacity(
                      0.5,
                    ),
            ),
            itemSize: 30,
            unratedColor: CColors.yellow,
            onRatingUpdate: (rating) {
              setState(() {
                this.rating = rating;
              });
            },
          ),
          const VMarginWidget(),
          TextFieldWidget(
            controller: review,
            label: 'Share your Review with us '.tr,
          ),
          const VMarginWidget(factor: 2),
          SizedBox(
            width: 129,
            height: 39,
            child: PrimaryButton(
              text: 'Submit'.tr,
              onPressed: () {
                var uuid = const Uuid();
                var model = ReviewModel(
                    userId: "2121",
                    id: uuid.v1(),
                    comment: review.text,
                    date: DateTime.now().millisecondsSinceEpoch,
                    rating: rating);
                context.pop(data: model);
              },
            ),
          ),
        ],
      ),
    );
  }
}
