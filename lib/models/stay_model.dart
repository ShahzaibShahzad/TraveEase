import 'package:travel_book/models/review_model.dart';

class StayModel {
  late String id;
  double? rating;
  String? title;
  String? location;
  String? cancellationHeader;
  String? cancellationDescription;
  String? locationHeading;
  String? locationDescription;
  double? numPeople;
  List<String>? facilities;
  String? description;
  String? placeDescription;
  double? latitude;
  double? longitude;
  double? price;
  String? address;
  String? checkIn;
  String? category;
  List<String>? images;
  List<String>? attributes;
  DateTime? timePosted;
  List<ReviewModel>? reviews = [];

  StayModel({
    required this.id,
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
    this.numPeople,
    this.price,
    this.title,
    this.location,
    this.locationDescription,
    this.checkIn,
    this.facilities,
    this.locationHeading,
    this.category,
    this.attributes,
    this.reviews,
  });


  StayModel.fromJson(Map<String, dynamic> json) {
    rating = json['rating'].toDouble();
    id = json['id'];
    title = json['title'];
    placeDescription = json['placeDescription'];

    if (json['longitude'] != null) {
      longitude = json['longitude'].toDouble();
    }
    if (json['latitude'] != null) {
      latitude = json['latitude'].toDouble();
    }

    address = json['address'];
    images = List<String>.from(json['images'] as List);
    attributes = List<String>.from(json['attributes'] ?? []);
    description = json['description'];
    cancellationDescription = json['cancellationDescription'];
    cancellationHeader = json['cancellationHeader'];
    facilities = List<String>.from(json['facilities'] as List);
    numPeople = json['numPeople'].toDouble();
    price = json['price'].toDouble();
    checkIn = json['checkIn'];
    locationHeading = json['locationHeading'];
    locationDescription = json['locationDescription'];
    location = json['location'];
    category = json['category'] ?? "Rome Transfers";
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
    data['description'] = description;
    data['cancellationHeader'] = cancellationHeader;
    data['cancellationDescription'] = cancellationDescription;
    data['facilities'] = facilities;
    data["numPeople"] = numPeople;
    data["price"] = price;
    data["checkIn"] = checkIn;
    data["category"] = category;
    data["attributes"] = attributes;
    data["locationHeading"] = locationHeading;
    data["locationDescription"] = locationDescription;
    data["location"] = location;

    if (timePosted != null) {
      data["timePosted"] = timePosted!.millisecondsSinceEpoch;
    }

    return data;
  }
}
