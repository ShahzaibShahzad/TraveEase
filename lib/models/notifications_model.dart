import 'package:travel_book/models/user_model.dart';
class NotificationsModel {
  late String id;
  late String icon;
  late String title;
  late String description;
  late DateTime timePosted;
  late List<String> usersNotification;

  NotificationsModel(
      {required this.timePosted,
      required this.description,
      required this.title,
      required this.icon,
      required this.id,
        required this.usersNotification
      });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "icon": icon,
      "title": title,
      "description": description,
      "timePosted": timePosted.millisecondsSinceEpoch,

    };
  }

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    icon = json["icon"];
    title = json["title"];
    description = json["description"];
    timePosted = DateTime.fromMillisecondsSinceEpoch(json["timePosted"]);
    List usersNotification = json["usersNotification"] ??[];
    this.usersNotification = List.generate(usersNotification.length, (index) => usersNotification[index]);



  }
}
