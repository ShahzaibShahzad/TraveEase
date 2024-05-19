import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:travel_book/extras/app_strings.dart';
import 'package:travel_book/screens/auth/signin.dart';
import 'package:travel_book/screens/startup/splash.dart';
import 'extras/colors.dart';
import 'providers/data_provider.dart';

Future<void> main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataProvider()),
      ],
      child: GetMaterialApp(
        title: 'Rome Italy Travel',
        translations: AppStrings(),
        locale: const Locale("en"),
        theme: ThemeData(
          primarySwatch: CColors.getMaterialColor(),
        ),
        home: const SignIn(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Splash() ;
  }
}
