import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:travel_book/extras/functions.dart';
import 'package:travel_book/models/special_offer_model.dart';
import 'package:travel_book/models/tour_booking.dart';
import 'package:travel_book/models/tour_model.dart';
import 'package:travel_book/providers/data_provider.dart';
import 'package:travel_book/widgets/tour_booking_summary.dart';
import 'package:utility_extensions/utility_extensions.dart';
import '../../../extras/app_textstyle.dart';
import '../../../models/stay_booking.dart';
import '../../../widgets/margin_widget.dart';
import '../../../widgets/save_horizontalcontainer_widget.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({Key? key}) : super(key: key);

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  late double width;
  String selectedText = "Tours".tr;
  late DataProvider data;

  List<StayBooking> stayBookings = [];
  List<TourBooking> tourBooking = [];
  List<TourBooking> reservationOffers = [];

  int length = 0;

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Consumer<DataProvider>(builder: (context, value, child) {
      data = value;

      stayBookings = data.stayBookings;
      tourBooking = data.tourBookings;
      reservationOffers = data.reservedOffers;

      if (selectedText == "Stays") {
        length = stayBookings.length;
      } else if (selectedText == "Tours") {
        length = tourBooking.length;
      } else if (selectedText == "Special Offers") {
        length = reservationOffers.length;
      }
      return Scaffold(
        appBar: AppBar(
          title: buildText("Bookings".tr),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VMarginWidget(),
                selectionWidget(),
                const VMarginWidget(),
                buildText("Booking Summary".tr),
                const VMarginWidget(),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      if (selectedText == "Stays".tr) {
                        return staySummary(stayBookings[index]);
                      } else if (selectedText == "Tours".tr) {
                        return tourSummary(tourBooking[index]);
                      } else if (selectedText == "Special Offers".tr) {
                        return reservationSummary(reservationOffers[index]);
                      } else {
                        return Container();
                      }
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 1,
                        color: Colors.black.withOpacity(
                          0.25,
                        ),
                      );
                    },
                    itemCount: length,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget selectionWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SaveContainerWidget(
          text: "Tours".tr,
          selectedText: selectedText,
          onTap: (val) {
            setState(() {
              selectedText = val;
              length = tourBooking.length;
            });
          },
        ),
        SaveContainerWidget(
          text: "Stays".tr,
          selectedText: selectedText,
          onTap: (val) {
            setState(() {
              selectedText = val;
              length = stayBookings.length;
            });
          },
        ),
        SaveContainerWidget(
          text: "Special Offers".tr,
          selectedText: selectedText,
          onTap: (val) {
            setState(() {
              selectedText = val;
              length = 0;
            });
          },
        ),
      ],
    );
  }

  Widget staySummary(StayBooking roomBooking) {
    return Column(
      children: [
        const VMarginWidget(),
        rowWidget(
            "Check In".tr, Functions.formatDate(roomBooking.reservedDateTime)),
        const VMarginWidget(),
        rowWidget("Nights to stay".tr, "${roomBooking.numDays}"),
        const VMarginWidget(),
        //rowWidget("Price Per Night".tr, "\$${roomBooking.pricePerNight}"),
        rowWidget(
            "Price Per Night".tr, "${roomBooking.pricePerNight.toInt()} \$"),
        const VMarginWidget(),
        rowWidget(
          "Total Price".tr,
          "${roomBooking.totalAmount.toInt()} \$",
        ),

        const VMarginWidget(),
      ],
    );
  }

  Widget tourSummary(TourBooking tourBooking) {
    var tour = data.tours
        .where((element) => element.id == tourBooking.tourID)
        .toList();
    TourModel tourModel = data.tours.first;


    return InkWell(
      onTap: () {
        context.push(
            child: TourBookingSummary(
          tourBooking: tourBooking,
          tourModel: tourModel,
        ));
      },
      child: Column(
        children: [
          const VMarginWidget(),
          rowWidget("Tour Title".tr, tourModel.title!),
          const VMarginWidget(),
          rowWidget("Tour Date".tr, Functions.formatDate(tourBooking.dateTime)),
          const VMarginWidget(),
          rowWidget(
              "Number of participants".tr, "${tourBooking.numParticipants}"),
          const VMarginWidget(),
          rowWidget(
              "Price per person".tr,
              "${tourBooking.pricePerPerson.toInt()} \$"),

          const VMarginWidget(),
          rowWidget(
              "Total Price".tr,
              "${(tourBooking.pricePerPerson * tourBooking.numParticipants).toInt()} \$"),
          const VMarginWidget(),
        ],
      ),
    );
  }

  Widget reservationSummary(TourBooking tourBooking) {
    var tour = data.specialOffers;
    SpecialOfferModel specialOffer;
    if (tour.isNotEmpty) {
      specialOffer = tour.first;
    } else {
      return Container();
    }

    return InkWell(
      onTap: () {
        context.push(
            child: TourBookingSummary(
          tourBooking: tourBooking,
          specialOffer: specialOffer,
        ));
      },
      child: Column(
        children: [
          const VMarginWidget(),
          rowWidget("Reservation Title".tr, specialOffer.title!),
          const VMarginWidget(),
          rowWidget("Date".tr, Functions.formatDate(tourBooking.dateTime)),
          const VMarginWidget(),
          rowWidget(
              "Number of participants".tr, "${tourBooking.numParticipants}"),
          const VMarginWidget(),
          rowWidget(
              "Price per person".tr,
              "${tourBooking.pricePerPerson.toInt()} \$"),
          const VMarginWidget(),
          rowWidget(
              "Total Price".tr,
             "${tourBooking.totalAmount.toInt()} \$"),
          const VMarginWidget(),
        ],
      ),
    );
  }

  Widget rowWidget(String str1, String str2) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          str1,
          style: AppTextStyle.urbanist(
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const HMarginWidget(
          factor: 5,
        ),
        Expanded(
          child: Text(
            str2,
            textAlign: TextAlign.end,
            style: AppTextStyle.urbanist(
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Text buildText(String str) {
    return Text(
      str.tr,
      style: AppTextStyle.urbanist(
        style: const TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
