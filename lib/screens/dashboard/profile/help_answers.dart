
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:travel_book/generated/assets.dart';
import 'package:travel_book/models/help_model.dart';
import 'package:travel_book/providers/data_provider.dart';
import '../../../extras/colors.dart';
import '../../../widgets/back_button_widget.dart';
import '../../../widgets/heading_widget.dart';
import '../../../widgets/margin_widget.dart';
import '../../../widgets/text_widget.dart';

class HelpAnswer extends StatefulWidget {
  final HelpModel model;

  const HelpAnswer({required this.model, Key? key}) : super(key: key);

  @override
  State<HelpAnswer> createState() => _HelpAnswerState();
}

class _HelpAnswerState extends State<HelpAnswer> {
  late double width;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
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
            HeadingWidget(
              text: widget.model.question,
            ),
            const VMarginWidget(
              factor: 0.6,
            ),
            TextWidget(text: widget.model.answer),
            const VMarginWidget(
              factor: 0.3,
            ),
            Consumer<DataProvider>(
              builder: (context, value, child){
                var userModel = value.userModel!;
                return Row(
                  children: [
                    IconButton(
                      onPressed: () {

                      },
                      icon: ImageIcon(
                        const AssetImage(Assets.like1),
                        color: userModel.likedQuestions.contains(widget.model.id) ? CColors.primary : CColors.grey3,
                      ),
                    ),
                    IconButton(
                      onPressed: () {

                      },
                      icon: ImageIcon(
                        const AssetImage(Assets.dislike),
                        color: userModel.unlikedQuestions.contains(widget.model.id) ? CColors.primary : CColors.grey3,
                      ),
                    ),
                  ],
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
