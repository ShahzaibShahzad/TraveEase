import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_book/providers/data_provider.dart';
import 'package:travel_book/widgets/margin_widget.dart';
import 'package:utility_extensions/utility_extensions.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../widgets/notification_widget.dart';

class Notifications extends StatefulWidget {
   Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    late DataProvider provider;
    return Consumer<DataProvider>(
      builder: (context,value,child) {
        provider = value;
        return ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.03,),
          itemBuilder: (ctx, i) {
            var model = provider.notifications[i];
            var time = timeago.format(model.timePosted);
            var previousTime = i != 0 ? timeago.format(provider.notifications[i - 1].timePosted) : "";
            return NotificationWidget(
              model: model,
              time: time,
              previousTime: previousTime,
              key: Key(model.id),
            );
          },
          separatorBuilder: (ctx, i) {
            return const VMarginWidget();
          },
          itemCount: provider.notifications.length,
        ).removeScrollEffect();
      }
    );
  }
}
