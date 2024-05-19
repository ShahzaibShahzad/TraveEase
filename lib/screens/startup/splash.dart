// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_book/extras/app_textstyle.dart';
import 'package:travel_book/screens/dashboard/dashboard.dart';
import 'package:travel_book/screens/startup/on_boarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utility_extensions/utility_extensions.dart';
import '../../extras/functions.dart';
import '../../generated/assets.dart';
import '../auth/signin.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 1),
    ).then((value) async {
      context.pushReplacement(child: const OnBoarding());
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Image(
                image: AssetImage(
                  Assets.imagesLogo,
                ),
                height: 82,
              ),
            ),
          ),
          Text(
            "Version 1.0.0",
            style: AppTextStyle.urbanist(
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
