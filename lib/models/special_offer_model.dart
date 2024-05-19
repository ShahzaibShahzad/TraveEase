import 'package:travel_book/models/slot_model.dart';

class SpecialOfferModel {
  String? id;
  double? rating;
  String? title;
  String? location;
  String? link;
  String? time;
  String? dealDescription;
  String? placeDescription;
  String? locationDescription;
  double? longitude;
  double? latitude;
  String? address;
  String? category;
  List<String>? images;
  DateTime? timePosted;
  List<SlotModel>? slots;
  double? price;
  double? numPeople;

  SpecialOfferModel(
      {this.id,
      this.rating,
      this.title,
      this.location,
      this.link,
      this.time,
      this.dealDescription,
      this.placeDescription,
      this.locationDescription,
      this.longitude,
      this.latitude,
      this.address,
      this.images,
      this.category,
      this.slots,
      this.timePosted,
      this.price,
      this.numPeople});

  SpecialOfferModel.fromJson(Map<String, dynamic> json) {
    rating = json['rating'].toDouble();
    id = json['id'];
    title = json['title'];
    location = json['location'];
    link = json['link'];
    time = json['time'];
    dealDescription = json['dealDescription'];
    placeDescription = json['placeDescription'];
    locationDescription = json['locationDescription'];
    longitude = json['longitude'].toDouble();
    latitude = json['latitude'].toDouble();
    address = json['address'];
    category = json['category'] ?? "Rome Transfers";
    images = List<String>.from(json['images'] as List);
    numPeople = json['numPeople'].toDouble();
    price = json['price'].toDouble();

    timePosted = DateTime.fromMicrosecondsSinceEpoch(json['timePosted']);
    List slots = json['slots'] ?? [];
    this.slots =
        List.generate(slots.length, (index) => SlotModel.fromMap(slots[index]));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rating'] = rating;
    data['title'] = title;
    data['id'] = id;
    data['location'] = location;
    data['link'] = link;
    data['time'] = time;
    data['dealDescription'] = dealDescription;
    data['placeDescription'] = placeDescription;
    data['locationDescription'] = locationDescription;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['address'] = address;
    data["images"] = images;
    data["category"] = category;
    data["timePosted"] = timePosted!.millisecondsSinceEpoch;
    if (slots != null) {
      data['slots'] = List<Map<String, dynamic>>.generate(
          slots!.length, (index) => slots![index].toMap());
    }
    data["numPeople"] = numPeople;
    data["price"] = price;

    return data;
  }
}
