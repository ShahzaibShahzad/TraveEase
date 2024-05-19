class ReviewModel {
  late String userId, id, comment;
  late int date;
  late double rating;

  ReviewModel({
    required this.userId,
    required this.id,
    required this.comment,
    required this.date,
    required this.rating,
  });

  ReviewModel.fromMap(Map<String, dynamic> data){
    id = data["id"];
    userId = data["userId"];
    comment = data["comment"];
    date = data["date"];
    rating = data["rating"];
  }

  Map<String, dynamic> toMap(){
    return {
      "id" : id,
      "userId" : userId,
      "comment" : comment,
      "date" : date,
      "rating" : rating,
    };
  }
}
