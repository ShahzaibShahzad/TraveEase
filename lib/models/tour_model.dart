import 'package:travel_book/models/review_model.dart';
import 'package:travel_book/models/slot_model.dart';
import 'package:travel_book/models/tour_date.dart';

class TourModel {
  late String id;
  double? rating;
  String? title;
  String? category;
  String? cancellationHeader;
  String? cancellationDescription;
  String? durationHeader;
  String? durationDescription;
  double? numPeople;
  List<String>? whatIncluded;
  String? description;
  List<String>? highlights;
  List<String>? knowBeforeGo;
  String? placeDescription;
  double? latitude;
  double? longitude;
  double? price;
  String? address;
  List<String>? images;
  DateTime? timePosted;
  List<TourDate>? tourDates;

  List<SlotModel>? slots;
  List<ReviewModel>? reviews = [];

  TourModel(
      {required this.id,
      this.rating,
      this.placeDescription,
      this.longitude,
      this.latitude,
      this.address,
      this.images,
      this.timePosted,
      this.description,
      this.cancellationDescription,
      this.cancellationHeader,
      this.highlights,
      this.knowBeforeGo,
      this.numPeople,
      this.price,
      this.whatIncluded,
      this.title,
      this.durationDescription,
      this.durationHeader,
      this.category,
      this.tourDates,
      this.reviews,
      this.slots});

  TourModel.fromJson(Map<String, dynamic> json) {
    rating = json['rating'].toDouble();
    id = json['id'];
    title = json['title'];
    placeDescription = json['placeDescription'];
    durationDescription = json['durationDescription'];
    durationHeader = json['durationHeader'];
    longitude = json['longitude'].toDouble();
    latitude = json['latitude'].toDouble();
    category = json['category'] ?? "Rome Transfers";
    address = json['address'];
    images = List<String>.from(json['images'] as List);
    description = json['description'];
    cancellationDescription = json['cancellationDescription'];
    cancellationHeader = json['cancellationHeader'];
    highlights = List<String>.from(json['highlights'] as List);
    knowBeforeGo = List<String>.from(json['knowBeforeGo'] as List);
    numPeople = json['numPeople'].toDouble();
    price = json['price'].toDouble();
    List tourDates = json['tourDates'] ?? [];
    this.tourDates = List.generate(
        tourDates.length, (index) => TourDate.fromJson(tourDates[index]));

    List slots = json['slots'] ?? [];
    this.slots =
        List.generate(slots.length, (index) => SlotModel.fromMap(slots[index]));
    whatIncluded = List<String>.from(json['whatIncluded'] as List);
    timePosted = DateTime.fromMillisecondsSinceEpoch(json['timePosted']);

    List reviews = json["reviews"] ?? [];
    this.reviews = List.generate(
        reviews.length, (index) => ReviewModel.fromMap(reviews[index]));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rating'] = rating;
    data['title'] = title;
    data['id'] = id;
    data['placeDescription'] = placeDescription;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['address'] = address;
    data['images'] = images;
    if (slots != null) {
      data['slots'] = List<Map<String, dynamic>>.generate(
          slots!.length, (index) => slots![index].toMap());
    }

    if (tourDates != null) {
      data['tourDates'] = List<Map<String, dynamic>>.generate(
          tourDates!.length, (index) => tourDates![index].tojson());
    }

    data['description'] = description;
    data['cancellationHeader'] = cancellationHeader;
    data['cancellationDescription'] = cancellationDescription;
    data['highlights'] = highlights;
    data["knowBeforeGo"] = knowBeforeGo;
    data["numPeople"] = numPeople;
    data["price"] = price;
    data["durationDescription"] = durationDescription;
    data["durationHeader"] = durationHeader;
    data["category"] = category;
    data["whatIncluded"] = whatIncluded;
    if (timePosted != null) {
      data["timePosted"] = timePosted!.millisecondsSinceEpoch;
    }

    return data;
  }
}
