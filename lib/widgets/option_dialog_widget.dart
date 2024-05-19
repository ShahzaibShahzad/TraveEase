import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:travel_book/models/offer_reservation.dart';
import 'package:travel_book/models/stay_booking.dart';
import 'package:utility_extensions/utility_extensions.dart';
import '../extras/app_textstyle.dart';
import '../extras/colors.dart';
import '../extras/constant.dart';
import '../models/tour_booking.dart';

class OptionDialog extends StatefulWidget {
  final double totalAmount;
  TourBooking? tourBooking;
  StayBooking? roomBooking;
  OfferReservation? offerReservation;

  OptionDialog({
    super.key,
    required this.totalAmount,
    this.tourBooking,
    this.roomBooking,
    this.offerReservation,
  });

  @override
  State<OptionDialog> createState() => _OptionDialogState();
}

class _OptionDialogState extends State<OptionDialog> {
  // for stripe
  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              "Please select the option",
              style: AppTextStyle.urbanist(
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ),
          TextButton.icon(
            icon: const Icon(Icons.add_card_rounded),
            label: Text(
              "Card",
              style: AppTextStyle.urbanist(
                style: TextStyle(
                    color: CColors.black, fontWeight: FontWeight.w600),
              ),
            ),
            onPressed: () {
              makePayment();
            },
          ),
          TextButton.icon(
            icon: Icon(Icons.paypal, color: CColors.blue),
            label: Text(
              "paypal",
              style: AppTextStyle.urbanist(
                style: TextStyle(
                    color: CColors.black, fontWeight: FontWeight.w600),
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  void onApplePayResult(dynamic paymentResult) {
    context.pop();
    context.pop();
    context.pop();
  }

  // for stripe
  Future<void> makePayment() async {
    // display payment sheet
    displayPaymentSheet();
  }

  void onGooglePayResult(dynamic paymentResult) {}

  displayPaymentSheet() async {}

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {}

  calculateAmount(String amount) {
    final calculatedAmount = (int.parse(amount)) * 100;
    return calculatedAmount.toString();
  }
}
