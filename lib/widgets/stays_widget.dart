import 'package:flutter/material.dart';
import 'package:travel_book/widgets/stay_widget.dart';
import 'package:utility_extensions/utility_extensions.dart';
import '../models/stay_model.dart';
import 'margin_widget.dart';

class StaysWidget extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final List<StayModel> stays;

  StaysWidget({super.key, required this.padding, required this.stays});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        padding: padding,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, i) {
          return StayWidget(
            index: i,
            model: stays[i],
          );
        },
        separatorBuilder: (ctx, i) {
          return const HMarginWidget();
        },
        itemCount: stays.length,
      ).removeScrollEffect(),
    );
  }
}
