import 'package:flutter/material.dart';
import 'package:travel_book/widgets/tour_ticket_widget.dart';
import 'package:utility_extensions/utility_extensions.dart';

import '../models/tour_model.dart';
import 'margin_widget.dart';

class TourAndTicketWidget extends StatelessWidget {
  final List<TourModel> tours;
  final EdgeInsetsGeometry padding;

  const TourAndTicketWidget(
      {required this.tours, required this.padding, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 225,
      child: ListView.separated(
        padding: padding,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, i) {
          return TourTicketWidget(
            index: i,
            model: tours[i],
          );
        },
        separatorBuilder: (ctx, i) {
          return const HMarginWidget();
        },
        itemCount: tours.length,
      ).removeScrollEffect(),
    );
  }
}
