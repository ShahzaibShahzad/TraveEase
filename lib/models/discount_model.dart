class DiscountModel {
  late String id;
  late String discountNumber;
  late int discountPercentage;
  late List<String> expired;

  DiscountModel({
    required this.id,
    required this.discountPercentage,
    required this.discountNumber,
    required this.expired,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "discountNumber": discountNumber,
      "discountPercentage": discountPercentage,
      "expired": expired,
    };
  }

  DiscountModel.fromJson(Map<String, dynamic> data) {
    id = data["id"];
    discountNumber = data["discountNumber"];
    discountPercentage = data["discountPercentage"];
    expired = List<String>.from(data['expired'] ?? []);
  }
}
