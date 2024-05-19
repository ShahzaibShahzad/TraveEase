import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:travel_book/extras/functions.dart';
import 'package:travel_book/models/discount_model.dart';
import 'package:travel_book/models/participant.dart';
import 'package:travel_book/models/special_offer_model.dart';
import 'package:travel_book/models/tour_booking.dart';
import 'package:travel_book/models/tour_model.dart';
import 'package:travel_book/providers/data_provider.dart';
import 'package:travel_book/widgets/primary_button_widget.dart';
import 'package:travel_book/widgets/text_field_widget.dart';
import 'package:utility_extensions/utility_extensions.dart';
import '../extras/app_textstyle.dart';
import '../extras/colors.dart';
import '../models/offer_reservation.dart';
import 'margin_widget.dart';
import 'option_dialog_widget.dart';

class OptionDetails extends StatefulWidget {
  final int participants;
  final double totalAmount;
  TourModel? tourModel;
  SpecialOfferModel? specialOffer;
  final DateTime dateTime;
  final DiscountModel? discountModel;

  OptionDetails(
      {super.key,
      required this.totalAmount,
      required this.discountModel,
      this.specialOffer,
      required this.participants,
      this.tourModel,
      required this.dateTime});

  @override
  State<OptionDetails> createState() => _OptionDetailsState();
}

class _OptionDetailsState extends State<OptionDetails> {
  List<Participant> participant = [];
  List<String> drinkList = [];

  @override
  void initState() {
    super.initState();

    participant = List<Participant>.generate(
        widget.participants,
        (index) => Participant(
            firstName: TextEditingController(),
            lastName: TextEditingController(),
            preferredDrink: null));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, value, child) {
      drinkList = value.drinksList;

      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Booking Details".tr,
            style: AppTextStyle.urbanist(
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const VMarginWidget(factor: 0.5),
                if (widget.tourModel != null) ...[
                  Text(
                    "${widget.tourModel!.title}",
                    style: AppTextStyle.urbanist(
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Text(
                    "Date: 23 Dec 2022 ",
                    style: AppTextStyle.urbanist(
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 11,
                          color: CColors.grey3),
                    ),
                  ),
                  Text(
                    "Edit Booking ".tr,
                    style: AppTextStyle.urbanist(
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: CColors.primary),
                    ),
                  ),
                ],
                const VMarginWidget(),
                Expanded(
                  child: ListView.separated(
                    itemCount: widget.participants,
                    itemBuilder: (ctx, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "First Name ".tr,
                            style: AppTextStyle.urbanist(
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          TextFieldWidget(
                            controller: participant[index].firstName,
                            label: '',
                          ),
                          const VMarginWidget(
                            factor: 0.5,
                          ),
                          Text(
                            "Last Name ".tr,
                            style: AppTextStyle.urbanist(
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          TextFieldWidget(
                              controller: participant[index].lastName,
                              label: ""),
                          const VMarginWidget(factor: 0.5),
                          Text(
                            "Preferred Drink at Location 1 ".tr,
                            style: AppTextStyle.urbanist(
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 14),
                            ),
                          ),
                          DropdownButtonFormField(
                            hint: Text("Please Select Drink".tr),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: CColors.grey, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: CColors.grey, width: 1),
                              ),
                            ),
                            value: participant[index].preferredDrink,
                            onChanged: (String? newValue) {
                              setState(() {
                                participant[index].preferredDrink = newValue!;
                              });
                            },
                            items: drinkList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const VMarginWidget();
                    },
                  ),
                ),
                const VMarginWidget(factor: 1),
                Center(
                  child: SizedBox(
                    width: 120,
                    child: PrimaryButton(
                      text: "Book now".tr,
                      onPressed: () async {
                        List<Participant> list = participant.where((element) {
                          return element.firstName.text.isEmpty ||
                              element.lastName.text.isEmpty ||
                              element.preferredDrink == null;
                        }).toList();
                        if (list.isNotEmpty) {
                          Functions.showSnackBar(context,
                              "Please Fill all participants details".tr);
                          return;
                        }

                        if (widget.tourModel != null) {
                          TourBooking tourBooking = TourBooking(
                              userID: "sadas",
                              dateTime: widget.dateTime,
                              model: widget.discountModel,
                              bookingDateTime: DateTime.now(),
                              lastName:"raza",
                              firstName: "ahmed",
                              participants: participant,
                              pricePerPerson: widget.tourModel!.price!,
                              totalAmount: widget.totalAmount,
                              numParticipants: widget.participants,
                              tourID: widget.tourModel!.id);

                          context.pop();
                          showDialog(
                            context: context,
                            builder: (_) => OptionDialog(
                              totalAmount: widget.totalAmount,
                              tourBooking: tourBooking,
                            ),
                          );
                        } else {

                          OfferReservation reservation = OfferReservation(
                              userID: "das",
                              dateTime: widget.dateTime,
                              model: widget.discountModel,
                              bookingDateTime: DateTime.now(),
                              lastName: "raza",
                              firstName: "ahmed",
                              participants: participant,
                              pricePerPerson: widget.specialOffer!.price!,
                              totalAmount: widget.totalAmount,
                              numParticipants: widget.participants,
                              tourID: widget.specialOffer!.id.toString());

                          context.pop();
                          showDialog(
                            context: context,
                            builder: (_) => OptionDialog(
                              totalAmount: widget.totalAmount,
                              offerReservation: reservation,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
