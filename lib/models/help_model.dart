
class HelpModel {
  late String question;
  late String answer;
  late String category;
  late String id;

  HelpModel({
    required this.question,
    required this.answer,
    required this.category,
    required this.id,
  });

  HelpModel.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
    id = json["id"];
    category = json["category"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    data['answer'] = answer;
    data['id'] = id;
    data['category'] = category;
    return data;
  }
}