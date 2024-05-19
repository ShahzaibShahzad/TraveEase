import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:travel_book/extras/constant.dart';
import 'package:travel_book/providers/data_provider.dart';
import 'package:travel_book/widgets/primary_button_widget.dart';
import 'package:travel_book/widgets/text_field_widget.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:utility_extensions/utility_extensions.dart';
import '../extras/app_textstyle.dart';
import '../extras/colors.dart';
import '../models/stay_model.dart';
import '../models/stay_booking.dart';
import 'margin_widget.dart';
import 'option_dialog_widget.dart';

class StayBookingDialog extends StatefulWidget {
  final StayModel model;

  const StayBookingDialog({super.key, required this.model});

  @override
  State<StayBookingDialog> createState() => _StayBookingDialog();
}

class _StayBookingDialog extends State<StayBookingDialog> {
  DateTime date = DateTime.now();
  var format = DateFormat("hh:mm a");
  late DataProvider provider;
  DateTime? checkIn;

  int number = 2;

  TextEditingController discountCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, value, child) {
      provider = value;
      return AlertDialog(
        content: SizedBox(
          width: 300,
          child: SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildText("Check In Date:".tr),
                  const VMarginWidget(factor: 0.3),
                  InkWell(
                    onTap: () async {
                      DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: checkIn ?? DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.utc(2023, 12, 31),
                      );
                      if (date != null) {
                        setState(() {
                          checkIn = date;
                        });
                      }
                    },
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.black.withOpacity(0.3),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(checkIn == null
                                ? "Date"
                                : DateFormat.yMMMMd().format(checkIn!)),
                            const Icon(Icons.calendar_month_rounded)
                          ],
                        ),
                      ),
                    ),
                  ),
                  const VMarginWidget(),
                  buildText("Number of days:".tr),
                  const VMarginWidget(factor: 0.4),
                  Stack(
                    children: [
                      Align(
                        child: Container(
                          alignment: Alignment.center,
                          height: 47,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 1,
                                  color: CColors.grey3.withOpacity(0.5))),
                        ),
                      ),
                      NumberPicker(
                        axis: Axis.horizontal,
                        value: number,
                        minValue: 1,
                        maxValue: 20,
                        onChanged: (value) => setState(() => number = value),
                      ),
                    ],
                  ),
                  const VMarginWidget(
                    factor: 0.5,
                  ),
                  Text(
                    "Optional",
                    style: AppTextStyle.urbanist(
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const VMarginWidget(
                    factor: 0.2,
                  ),
                  TextFieldWidget(
                      controller: discountCode, label: "Enter discount code"),
                  const VMarginWidget(
                    factor: 0.9,
                  ),
                  Center(
                    child: SizedBox(
                      width: 149,
                      height: 45,
                      child: PrimaryButton(
                        text: "Book now".tr,
                        onPressed: () async {
                          

                          StayBooking roomBooking = StayBooking(
                            userID: "asda",
                            model: Constants.discount,
                            reservedDateTime: checkIn!,
                            lastName: "raza",
                            firstName:"ahmed",
                            totalAmount: 100,
                            stayID: widget.model.id,
                            pricePerNight: widget.model.price!,
                            numDays: number,
                            bookingDateTime: DateTime.now(),
                          );
                          context.pop();
                          showDialog(
                              context: context,
                              builder: (_) => OptionDialog(
                                    roomBooking: roomBooking,
                                    totalAmount: 100,
                                  ));
                        },
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      );
    });
  }

  Text buildText(String str) {
    return Text(
      str,
      style: AppTextStyle.urbanist(
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    );
  }

  TableCalendar<dynamic> buildTableCalendar() {
    return TableCalendar(
      firstDay: DateTime.now(),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: date,
      availableGestures: AvailableGestures.horizontalSwipe,
      calendarFormat: CalendarFormat.month,
      availableCalendarFormats: const {
        CalendarFormat.month: '',
        CalendarFormat.week: '',
      },
      selectedDayPredicate: (date) {
        return isSameDay(this.date, date);
      },
      onDaySelected: (dt, dtt) {
        setState(() {});
      },
      headerVisible: true,
      headerStyle: const HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
          leftChevronVisible: false,
          rightChevronVisible: false),
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
    );
  }
}
