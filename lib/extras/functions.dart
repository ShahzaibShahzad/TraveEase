import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:travel_book/extras/app_textstyle.dart';
import 'package:travel_book/extras/colors.dart';
import 'package:travel_book/models/offer_reservation.dart';
import 'package:travel_book/models/stay_booking.dart';
import 'package:travel_book/models/tour_booking.dart';
import 'package:travel_book/providers/data_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/discount_model.dart';
import '../models/review_model.dart';
import '../models/user_model.dart';
import '../widgets/loading_widget.dart';

class Functions {
  static Future<void> launchInBrowser(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  static String formatDate(DateTime dateTime) {
    return DateFormat.yMMMMd().format(dateTime);
  }

  static showToast(String message,
      {ToastGravity gravity = ToastGravity.BOTTOM}) {
    Fluttertoast.showToast(
      msg: message,
      gravity: gravity,
      backgroundColor: CColors.primary,
      fontSize: 12,
    );
  }

  static showSnackBar(BuildContext context, String message) {
    var snackBar = SnackBar(
      duration: const Duration(milliseconds: 800),
      content: Text(
        message,
        style: AppTextStyle.urbanist(
          style: TextStyle(
            color: CColors.white,
            fontSize: 16,
          ),
        ),
      ),
      backgroundColor: CColors.primary,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static showLoading(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return WillPopScope(
          onWillPop: () {
            return Future.value(kDebugMode);
          },
          child: const AlertDialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            content: LoadingWidget(),
          ),
        );
      },
      barrierDismissible: false,
    );
  }

  static double getRating(List<ReviewModel> list) {
    double rating = 0.0;

    for (var review in list) {
      rating += review.rating;
    }

    if (rating == 0.0) {
      return rating;
    }
    rating = rating / list.length;

    return rating;
  }
}
