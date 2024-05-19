class SlotModel {
  late DateTime date;
  List<DateTime> slots = [];

  SlotModel({
    required this.date,
    required this.slots,
  });

  SlotModel.fromMap(Map<String, dynamic> data){
    var date = data["date"];
    this.date = DateTime.fromMillisecondsSinceEpoch(date);
    List slots = data["slots"] ?? [];
    this.slots = List.generate(slots.length, (index) => DateTime.fromMillisecondsSinceEpoch(slots[index]));
  }

  Map<String, dynamic> toMap(){
    return {
      "date" : date.millisecondsSinceEpoch,
      "slots" : List.generate(slots.length, (index) => slots[index].millisecondsSinceEpoch),
    };
  }
}
