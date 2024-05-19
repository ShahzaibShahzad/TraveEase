import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../extras/colors.dart';

class DatePickerWidget extends StatefulWidget {
  DateTime dt;
  void Function(DateTime, DateTime) onDaySelected;

  DatePickerWidget({super.key, required this.onDaySelected, required this.dt});

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black.withOpacity(0.4),
        ),
      ),
      child: TableCalendar(
        rowHeight: 35,
        firstDay: DateTime.now(),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: DateTime.now(),
        availableGestures: AvailableGestures.horizontalSwipe,
        calendarFormat: CalendarFormat.month,
        availableCalendarFormats: const {
          CalendarFormat.month: '',
          CalendarFormat.week: '',
        },
        selectedDayPredicate: (date) {
          return isSameDay(widget.dt, date);
        },
        onDaySelected: widget.onDaySelected,
        headerVisible: true,
        headerStyle: HeaderStyle(
            titleTextStyle: const TextStyle(fontWeight: FontWeight.w700),
            leftChevronPadding: EdgeInsets.zero,
            rightChevronPadding: EdgeInsets.zero,
            leftChevronMargin: EdgeInsets.zero,
            rightChevronMargin: EdgeInsets.zero,
            leftChevronIcon:
                Icon(Icons.chevron_left, color: Colors.black.withOpacity(0.6)),
            rightChevronIcon:
                Icon(Icons.chevron_right, color: Colors.black.withOpacity(0.6)),
            titleCentered: true,
            formatButtonVisible: false,
            leftChevronVisible: true,
            rightChevronVisible: true),
        calendarStyle: CalendarStyle(
          isTodayHighlighted: true,
          todayDecoration: BoxDecoration(
            color: CColors.primary.withAlpha(99),
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: CColors.primary,
            shape: BoxShape.circle,
          ),
          selectedTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
