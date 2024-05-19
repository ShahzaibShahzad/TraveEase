class TourDate {
  late DateTime from;
  late DateTime to;

  TourDate({required this.to, required this.from});

  Map<String, dynamic> tojson() {
    return {
      "from": from.millisecondsSinceEpoch,
      "to": to.millisecondsSinceEpoch,
    };
  }

  TourDate.fromJson(Map<String, dynamic> json) {
    from = DateTime.fromMillisecondsSinceEpoch(json["from"]);
    to = DateTime.fromMillisecondsSinceEpoch(json["to"]);
  }
}
