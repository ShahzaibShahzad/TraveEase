
import 'package:flutter/material.dart';
import 'package:travel_book/extras/app_textstyle.dart';
import 'package:travel_book/extras/colors.dart';
import 'package:travel_book/models/notifications_model.dart';

class NotificationWidget extends StatelessWidget {
  NotificationWidget({required this.model, required this.time, required this.previousTime, Key? key}) : super(key: key);
  NotificationsModel model;

  String time, previousTime;



  @override
  Widget build(BuildContext context) {
    bool check = false;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(previousTime != time)
          Container(
            margin: EdgeInsets.only(bottom: height * 0.015),
            child: Text(
              time.toUpperCase(),
              style: AppTextStyle.cobblerSans(
                  fontSize: 12,
                  color: CColors.grey4,
              ),
            ),
          ),
          InkWell(
            onTap: () {

            },
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(
                    10,
                  ),
                  decoration: BoxDecoration(
                    color: CColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Image(
                    image: AssetImage("assets/icons/${model.icon}.png"),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: width * 0.05,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.title,
                          style: AppTextStyle.cobblerSans(
                            color: CColors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          model.description,
                          style: AppTextStyle.cobblerSans(
                            color: CColors.grey4,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (!check)
                  Align(
                    alignment: Alignment.topCenter,
                    child: Icon(
                      Icons.circle,
                      color: CColors.primary,
                      size: 12,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
