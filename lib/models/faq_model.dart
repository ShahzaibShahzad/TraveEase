class FAQModel {
  late String question;
  late String answer;

  FAQModel({
    required this.question,
    required this.answer,
  });

  FAQModel.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    data['answer'] = answer;

    return data;
  }
}
