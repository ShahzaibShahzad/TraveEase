import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:travel_book/extras/constant.dart';
import 'package:travel_book/extras/functions.dart';
import 'package:travel_book/models/tour_model.dart';
import 'package:travel_book/models/travel_blog_model.dart';
import 'package:travel_book/providers/data_provider.dart';
import 'package:travel_book/widgets/option_details_dialog.dart';
import 'package:travel_book/widgets/primary_button_widget.dart';
import 'package:travel_book/widgets/table_picker.dart';
import 'package:travel_book/widgets/text_field_widget.dart';
import '../extras/app_textstyle.dart';
import '../models/slot_model.dart';
import '../models/special_offer_model.dart';
import 'margin_widget.dart';

class TourBookingDialog extends StatefulWidget {
  TourModel? tourModel;
  SpecialOfferModel? specialOffer;

  TourBookingDialog({this.tourModel, this.specialOffer, Key? key})
      : super(key: key);

  @override
  State<TourBookingDialog> createState() => _TourBookingDialogState();
}

class _TourBookingDialogState extends State<TourBookingDialog> {
  var discountCode = TextEditingController();
  late double width, height;
  DateTime date = DateTime.now();
  int selectedParticipants = 1;
  DateTime? selectedSlot;
  SlotModel? slotModel;
  List<int> participant = [];
  var format = DateFormat("hh:mm a");
  late TourModel tourModel;
  late SpecialOfferModel specialOffer;
  late TravelBlogModel travelBlogModel;
  late DataProvider provider;

  String book = "Book now".tr;

  bool isTour = true;

  @override
  void initState() {
    super.initState();
    if (widget.tourModel != null) {
      tourModel = widget.tourModel!;
      participant = List<int>.generate(
          tourModel.numPeople!.toInt(), (index) => index + 1);
    } else {
      specialOffer = widget.specialOffer!;
      participant = List<int>.generate(
          specialOffer.numPeople!.toInt(), (index) => index + 1);

      isTour = false;
    }



    var value;
    if (isTour) {
      value = tourModel.slots!.where((element) {
        var f = DateFormat("dd MM yyyy");
        var d = f.parse(f.format(element.date));
        var d2 = f.parse(f.format(date));
        return d == d2;
      });
    } else {
      value = specialOffer.slots!.where((element) {
        var f = DateFormat("dd MM yyyy");
        var d = f.parse(f.format(element.date));
        var d2 = f.parse(f.format(date));
        return d == d2;
      });
    }

    if (value.isNotEmpty) {
      slotModel = value.first;
      selectedSlot = null;
      book = "Book now".tr;
    } else {
      book = "Not Available".tr;
      // Functions.showSnackBar(context,
      //     "There are no available slots for this date. Kindly select any other date.");
      slotModel = null;
      selectedSlot = null;
    }

    // slotModel = widget.model.slots.first;
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Consumer<DataProvider>(builder: (context, value, child) {
      provider = value;
      return Scaffold(
        appBar: AppBar(
          title: const Text("Booking Details"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.06, vertical: height * 0.03),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter Number of Participants".tr,
                    style: AppTextStyle.urbanist(
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const VMarginWidget(
                    factor: 0.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Adult".tr,
                            style: AppTextStyle.urbanist(
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Text(
                            "\$${isTour == true ? tourModel.price : specialOffer.price}",
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Container(
                        height: 40,
                        width: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 0),
                          child: DropdownButton<int>(
                            value: selectedParticipants,
                            isExpanded: true,
                            underline: const SizedBox(),
                            hint: const Text("Select"),
                            items:
                                participant.map<DropdownMenuItem<int>>((value) {
                              return DropdownMenuItem<int>(
                                value: value,
                                child: Text(
                                  "$value",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedParticipants = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const VMarginWidget(
                    factor: 0.6,
                  ),
                  Row(
                    children: [
                      Text(
                        "Choose a Date".tr,
                        style: AppTextStyle.urbanist(
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const Text(
                        " *",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  const VMarginWidget(
                    factor: 0.3,
                  ),
                  DatePickerWidget(
                    dt: date,
                    onDaySelected: (dt, dtt) {
                      setState(() {
                        date = dtt;
                        var value;
                        if (isTour) {
                          value = tourModel.slots!.where((element) {
                            var f = DateFormat("dd MM yyyy");
                            var d = f.parse(f.format(element.date));
                            var d2 = f.parse(f.format(date));
                            return d == d2;
                          });
                        } else {
                          value = specialOffer.slots!.where((element) {
                            var f = DateFormat("dd MM yyyy");
                            var d = f.parse(f.format(element.date));
                            var d2 = f.parse(f.format(date));
                            return d == d2;
                          });
                        }

                        if (value.isNotEmpty) {
                          slotModel = value.first;
                          selectedSlot = null;
                          book = "Book now".tr;
                        } else {
                          book = "Not Available".tr;
                          // Functions.showSnackBar(context,
                          //     "There are no available slots for this date. Kindly select any other date.");
                          slotModel = null;
                          selectedSlot = null;
                        }
                      });
                    },
                  ),
                  const VMarginWidget(),
                  Row(
                    children: [
                      Text(
                        "Choose a Time".tr,
                        style: AppTextStyle.urbanist(
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const Text(
                        " *",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  const VMarginWidget(
                    factor: 0.2,
                  ),
                  multiOptionWidget(),
                  const VMarginWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Price(EUR)",
                        style: AppTextStyle.urbanist(
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Text(
                        selectedParticipants == null
                            ? "\$${isTour == true ? tourModel.price : specialOffer.price}"
                            : "\$${getTotalPrice()}",
                        style: AppTextStyle.urbanist(
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w700),
                        ),
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
                  const VMarginWidget(),
                  Center(
                    child: SizedBox(
                      width: 149,
                      height: 45,
                      child: PrimaryButton(
                        text: book,
                        onPressed: () {

                          if (isTour) {
                            showDialog(
                              context: context,
                              builder: (_) => OptionDetails(
                                totalAmount: 100,
                                participants: selectedParticipants,
                                tourModel: tourModel,
                                dateTime: DateTime.now().add(Duration(days: 100)),
                                discountModel: Constants.discount,
                              ),
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (_) => OptionDetails(
                                totalAmount: 200,
                                participants: selectedParticipants,
                                specialOffer: specialOffer,
                                dateTime: DateTime.now().add(Duration(days: 100)),
                                discountModel: Constants.discount,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  const VMarginWidget(),
                  RichText(
                    text: TextSpan(
                        text: "Please note: ".tr,
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                        children: [
                          TextSpan(
                            text:
                                "After your purchase is confirmed we will email you a confirmation."
                                    .tr,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal),
                          )
                        ]),
                  ),
                  const VMarginWidget(),
                ]),
          ),
        ),
      );
    });
  }

  double getTotalPrice() {
    if (isTour) {
      return selectedParticipants * tourModel.price!;
    } else {
      return selectedParticipants * specialOffer.price!;
    }
  }

  Widget multiOptionWidget() {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black.withOpacity(0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Align(
          alignment: Alignment.centerLeft,
          child: DropdownButton(
            isExpanded: true,
            isDense: true,
            underline: const SizedBox(),
            hint: Text(
              selectedSlot == null ? "Select" : format.format(selectedSlot!),
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
            onChanged: (newValue) {
              setState(() {
                selectedSlot = newValue!;
              });
            },
            items: (slotModel?.slots ?? [])
                .map<DropdownMenuItem<DateTime>>((DateTime value) {
              return DropdownMenuItem<DateTime>(
                value: value,
                child: Text(
                  format.format(value),
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w700),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
