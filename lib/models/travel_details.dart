class TravelDetailsModel {
   String? title;
   String? link;
   String? timming;
   String? location;
   String? description1;
   String? image;
   String? imageDescription;
   String? description2;

  TravelDetailsModel({
     this.title,
     this.link,
     this.image,
     this.location,
     this.description1,
     this.description2,
     this.imageDescription,
     this.timming,
  });

  TravelDetailsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    link = json['link'];
    image = json['image'];
    location = json['location'];
    description2 = json['description2'];
    description1 = json['description1'];
    imageDescription = json['imageDescription'];
    timming = json['timming'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['link'] = link;
    data['image'] = image;
    data['location'] = location;
    data['description1'] = description1;
    data['description2'] = description2;
    data['imageDescription'] = imageDescription;
    data['timming'] = timming;

    return data;
  }
}
