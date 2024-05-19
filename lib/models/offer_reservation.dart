import 'package:travel_book/models/participant.dart';

import 'discount_model.dart';

class OfferReservation {
  String? id;
  late String userID;
  late String tourID;
  late String firstName;
  late String lastName;
  late int numParticipants;
  late double pricePerPerson;
  late DateTime dateTime;
  late DateTime bookingDateTime;
  late double totalAmount;
  late List<Participant> participants;
  String? type;
  DiscountModel? model;


  OfferReservation(
      {required this.dateTime,
        required this.lastName,
        required this.firstName,
        required this.participants,
        required this.pricePerPerson,
        required this.totalAmount,
        required this.userID,
        this.model,
        this.id,
        required this.numParticipants,
        required this.bookingDateTime,
        required this.tourID,
        this.type = "Offer"});

  Map<String, dynamic> toMap() {
    var participants = List.generate(
        this.participants.length, (index) => this.participants[index].toMap());
    return {
      "id": id,
      "userID" : userID,
      "type": type,
      "tourID": tourID,
      "firstName": firstName,
      "lastName": lastName,
      "numParticipants": numParticipants,
      "pricePerPerson": pricePerPerson,
      "dateTime": dateTime.millisecondsSinceEpoch,
      "bookingDateTime": bookingDateTime.millisecondsSinceEpoch,
      "totalAmount": totalAmount,
      "participants": participants,
      if (model != null) "discountVoucher": model!.discountNumber,

    };
  }

  OfferReservation.fromMap(Map<String, dynamic> data) {
    id = data["id"];
    tourID = data["tourID"];
    firstName = data["firstName"];
    lastName = data["lastName"];
    type = data["type"];
    userID = data["userID"];
    numParticipants = data["numParticipants"];
    pricePerPerson = data["pricePerPerson"];
    dateTime = DateTime.now();
    //   DateTime.fromMillisecondsSinceEpoch(data["dateTime"]);
    bookingDateTime =
        DateTime.fromMillisecondsSinceEpoch(data["bookingDateTime"]);
    totalAmount = data["totalAmount"];
    List participants = data["participants"] ?? [];
    this.participants = List.generate(participants.length,
            (index) => Participant.fromMap(participants[index]));
  }
}


