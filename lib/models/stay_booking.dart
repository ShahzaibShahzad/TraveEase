import 'package:travel_book/models/discount_model.dart';

class StayBooking {
  String? id;
  String? type;
  late String userID;
  late String stayID;
  late String firstName;
  late String lastName;
  late int numDays;
  late double pricePerNight;
  late DateTime reservedDateTime;
  late DateTime bookingDateTime;
  late double totalAmount;
  DiscountModel? model;

  StayBooking(
      {required this.reservedDateTime,
      required this.lastName,
      required this.firstName,
      required this.totalAmount,
      required this.userID,
      this.id,
      required this.stayID,
      required this.pricePerNight,
      this.model,
      required this.numDays,
      required this.bookingDateTime,
      this.type = "Stay"});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "type": type,
      "stayID": stayID,
      "userID": userID,
      "firstName": firstName,
      "lastName": lastName,
      "numDays": numDays,
      "pricePerNight": pricePerNight,
      "reservedDateTime": reservedDateTime.millisecondsSinceEpoch,
      "bookingDateTime": reservedDateTime.millisecondsSinceEpoch,
      "totalAmount": totalAmount,
      if (model != null) "discountVoucher": model!.discountNumber,
    };
  }

  StayBooking.fromMap(Map<String, dynamic> data) {
    id = data["id"];
    stayID = data["stayID"];
    type = data["type"];
    firstName = data["firstName"];
    lastName = data["lastName"];
    numDays = data["numDays"];
    userID = data["userID"];
    pricePerNight = data["pricePerNight"];
    reservedDateTime =
        DateTime.fromMillisecondsSinceEpoch(data["reservedDateTime"]);
    totalAmount = data["totalAmount"];
    bookingDateTime =
        DateTime.fromMillisecondsSinceEpoch(data["bookingDateTime"]);
  }
}
