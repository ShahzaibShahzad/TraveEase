import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../extras/app_textstyle.dart';
import '../../../extras/colors.dart';
class PushNotification extends StatefulWidget {
  const PushNotification({Key? key}) : super(key: key);

  @override
  State<PushNotification> createState() => _PushNotificationState();
}
class _PushNotificationState extends State<PushNotification> {
  bool receiveNotification = false;

  @override
  void initState() {
    initsp();
    super.initState();
  }

  late SharedPreferences pref;

  initsp() async{
    pref = await SharedPreferences.getInstance();

    receiveNotification = pref.getBool("noti") ?? false;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Push Notification"),
      ),
      body: SwitchListTile(
        title: Text("Notifications".tr,
            style: AppTextStyle.urbanist(
              style: const TextStyle(
                fontSize: 16,
                ),
            ),
        ),
        value: receiveNotification,
        onChanged: (value){
          setState(() {
            pref.setBool("noti", value);
            receiveNotification = value;
          });
        },
      ),
    );
  }
}
