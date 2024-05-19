import 'package:flutter/material.dart';
import 'package:travel_book/models/tour_date.dart';

class RadioWidget extends StatelessWidget {
  TourDate dateTime;
  String text;
  TourDate? selectedOption;
  void Function(TourDate?) onChanged;

  RadioWidget({required this.selectedOption,
    required this.dateTime,
  required this.onChanged,required this.text});

  @override
  Widget build(BuildContext context) {
    return RadioListTile<TourDate?>(
        title:  Text(text),
        value: dateTime,
        groupValue: selectedOption,
        onChanged: onChanged);
  }
}
