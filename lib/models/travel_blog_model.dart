import 'package:travel_book/models/faq_model.dart';
import 'package:travel_book/models/travel_details.dart';

class TravelBlogModel {
  late String id;
  double? rating;
  String? title;
  String? subTitle;
  String? date;
  String? category;
  String? description;
  double? longitude;
  double? latitude;
  String? heading2;
  String? subHeading2;
  String? link;
  String? image;
  double? price;
  DateTime? timePosted;
  List<FAQModel>? faq;
  List<TravelDetailsModel>? travelDetails;
  List<String>? images;

  TravelBlogModel({
    required this.id,
    this.category,
    this.rating,
    this.title,
    this.subTitle,
    this.date,
    this.description,
    this.longitude,
    this.latitude,
    this.heading2,
    this.link,
    this.timePosted,
    this.image,
    this.subHeading2,
    this.faq,
    this.travelDetails,
    this.images,
    this.price,
  });

  TravelBlogModel.fromJson(Map<String, dynamic> json) {
    rating = json['rating'].toDouble();
    id = json['id'];
    title = json['title'];
    subTitle = json['subTitle'];
    date = json['date'];
    description = json['description'];
    heading2 = json['heading2'];
    link = json['link'];
    json['longitude'] != null ? longitude = json['longitude'].toDouble() : null;
    json['latitude'] != null ? latitude = json['latitude'].toDouble() : null;
    var price = json["price"];
    price ??= json['price']?.toDouble();

    timePosted = DateTime.fromMillisecondsSinceEpoch(json['timePosted']);
    image = json['image'];
    subHeading2 = json['subHeading2'];
    List faq = json['faq'];
    category = json['category'] ?? "Rome Transfers";
    this.faq =
        List.generate(faq.length, (index) => FAQModel.fromJson(faq[index]));

    List travelDetails = json['travelDetails'] ?? [];
    this.travelDetails = List.generate(travelDetails.length,
        (index) => TravelDetailsModel.fromJson(travelDetails[index]));
    images = List<String>.from(json['images'] ?? [] as List);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rating'] = rating;
    data['title'] = title;
    data['id'] = id;
    data['subTitle'] = subTitle;
    data['date'] = date;
    data['description'] = description;
    data["timePosted"] = timePosted!.millisecondsSinceEpoch;
    data['heading2'] = heading2;
    data['link'] = link;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['image'] = image;
    data['subHeading2'] = subHeading2;
    data['faq'] = faq;
    data['travelDetails'] = travelDetails;
    data["images"] = images;
    data["category"] = category;
    data["price"] = price;

    return data;
  }
}
