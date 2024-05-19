import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:travel_book/providers/data_provider.dart';
import 'package:utility_extensions/utility_extensions.dart';

import '../../../widgets/back_button_widget.dart';
import '../../../widgets/divider_widget.dart';
import '../../../widgets/heading_widget.dart';
import '../../../widgets/margin_widget.dart';
import '../../../widgets/text_tile_widget.dart';
import 'help_answers.dart';

class HelpQuestions extends StatefulWidget {
  final String type;

  const HelpQuestions({required this.type, Key? key}) : super(key: key);

  @override
  State<HelpQuestions> createState() => _HelpQuestionsState();
}

class _HelpQuestionsState extends State<HelpQuestions> {
  late double width;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Consumer<DataProvider>(builder: (context, value, child) {
      var list = value.help
          .where((element) => element.category == widget.type)
          .toList();

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
                text: widget.type,
              ),
              const VMarginWidget(factor: 0.4),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (ctx, i) {
                    return const DividerWidget();
                  },
                  itemBuilder: (ctx, i) {
                    return TextTileWidget(
                      text: list[i].question,
                      onPressed: () {
                        context.push(child: HelpAnswer(model: list[i],));
                      },
                    );
                  },
                  itemCount: list.length,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
