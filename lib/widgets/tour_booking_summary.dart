import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:travel_book/models/tour_booking.dart';
import 'package:travel_book/models/tour_model.dart';

import '../extras/app_textstyle.dart';
import '../models/special_offer_model.dart';
import 'margin_widget.dart';

class TourBookingSummary extends StatelessWidget {
   TourBooking tourBooking;
   TourModel? tourModel;
   SpecialOfferModel? specialOffer;

   TourBookingSummary(
      {super.key, this.tourModel, required this.tourBooking, this.specialOffer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildText("Tour Booking Details".tr),
      ),
      body: Padding(
        padding: EdgeInsets.all(context.width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              rowWidget("First Name".tr, tourBooking.firstName),
              const VMarginWidget(),
              rowWidget("Last Name".tr, tourBooking.lastName),
              const VMarginWidget(),
              const Divider(thickness: 0.7),
              const VMarginWidget(),
              rowWidget(tourModel != null ? "Tour Title".tr : "Offer Title".tr, tourModel != null ? tourModel!.title! : specialOffer!.title!),
              const VMarginWidget(),
              rowWidget("Booked Slot".tr,
                  DateFormat.yMMMMd().add_jm().format(tourBooking.dateTime)),
              const VMarginWidget(),
              rowWidget(
                  "Price per Person".tr, "\$${tourBooking.pricePerPerson}"),
              const VMarginWidget(),
              rowWidget(
                  "Total Participants".tr, "${tourBooking.numParticipants}"),
              const VMarginWidget(),
              rowWidget("Total Price".tr, "\$${tourBooking.totalAmount}"),
              const VMarginWidget(),
              const Divider(thickness: 0.7),
              const VMarginWidget(),
              buildText("Participants Details".tr, size: 21),
              const VMarginWidget(),
              for (int i = 0; i < tourBooking.numParticipants; i++) ...[
                buildText("${i + 1}.", size: 21),
                const VMarginWidget(factor: 0.3),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.withOpacity(0.2)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        rowWidget("First Name".tr,
                            tourBooking.participants[i].firstName.text),
                        const VMarginWidget(),
                        rowWidget("Last Name".tr,
                            tourBooking.participants[i].lastName.text),
                        const VMarginWidget(),
                        rowWidget("Preferred Drink".tr,
                            tourBooking.participants[i].preferredDrink!),
                      ],
                    ),
                  ),
                ),
                const VMarginWidget(),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Text buildText(String str,
      {double size = 21, FontWeight weight = FontWeight.w600}) {
    return Text(
      str.tr,
      textAlign: TextAlign.end,
      style: AppTextStyle.urbanist(
        style: TextStyle(
          fontSize: size,
          fontWeight: weight,
        ),
      ),
    );
  }

  Widget rowWidget(String str1, String str2) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildText(str1, weight: FontWeight.w600, size: 16),
        const HMarginWidget(
          factor: 5,
        ),
        Expanded(
          child: buildText(str2, weight: FontWeight.w500, size: 16),
        ),
      ],
    );
  }
}

