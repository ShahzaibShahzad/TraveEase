import 'package:flutter/cupertino.dart';

class Participant {
  late TextEditingController firstName;
  late TextEditingController lastName;
   String? preferredDrink;

  Participant(
      {required this.firstName,
      required this.lastName,
       this.preferredDrink});

  Map<String, dynamic> toMap() {
    return {
      "firstName": firstName.text,
      "lastName": lastName.text,
      "preferredDrink": preferredDrink
    };
  }

  Participant.fromMap(Map<String, dynamic> data) {
    firstName = TextEditingController();
    lastName = TextEditingController();
    firstName.text = data["firstName"];
    lastName.text = data["lastName"];
    preferredDrink = data["preferredDrink"];
  }
}
