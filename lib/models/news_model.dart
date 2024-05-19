class NewsModel {
  late String id;
  late double rating;
  late String title;
  late String location;
  late String link;
  late String time;
  late String category;
  late String newsDescription;
  late String locationDescription;
  late double longitude;
  late double latitude;
  late String address;
  late List<String> images;
  late DateTime timePosted;

  NewsModel(
      {required this.id,
      required this.rating,
      required this.title,
      required this.location,
      required this.link,
      required this.time,
      required this.newsDescription,
      required this.locationDescription,
      required this.longitude,
      required this.latitude,
      required this.address,
      required this.images,
        required this.category,
      required this.timePosted});

  NewsModel.fromJson(Map<String, dynamic> json) {
    rating = json['rating'].toDouble();
    id = json['id'];
    title = json['title'];
    location = json['location'];
    link = json['link'];
    time = json['time'];
    newsDescription = json['newsDescription'];
    locationDescription = json['locationDescription'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    address = json['address'];
    category = json['category'] ?? "Rome Transfers";
    images = List<String>.from(json['images'] as List) ;
    timePosted = DateTime.fromMicrosecondsSinceEpoch(json['timePosted']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rating'] = rating;
    data['title'] = title;
    data['id'] = id;
    data['location'] = location;
    data['link'] = link;
    data['time'] = time;
    data['newsDescription'] = newsDescription;
    data['locationDescription'] = locationDescription;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['address'] = address;
    data["images"] = images;
    data["category"] = category;
    data["timePosted"] = timePosted.millisecondsSinceEpoch;

    return data;
  }
}
