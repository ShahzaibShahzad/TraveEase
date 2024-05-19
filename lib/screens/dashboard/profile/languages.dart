import 'package:flutter/material.dart';
import 'package:travel_book/widgets/back_button_widget.dart';
import 'package:travel_book/widgets/margin_widget.dart';

import '../../../widgets/divider_widget.dart';
import '../../../widgets/language_widget.dart';

class Languages extends StatefulWidget {
  const Languages({Key? key}) : super(key: key);

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  late double width;

  String selectedLanguage = "";
  List<String> languages = [
    "English",
    "Spanish",
    "Dutch",
    "Arabic",
    "French",
  ];

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VMarginWidget(),
              const BackButtonWidget(),
              const VMarginWidget(),
              Expanded(
                child: ListView.separated(
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    return LanguageWidget(
                      language: languages[index],
                      selected: selectedLanguage,
                      onSelect: (val) {
                        selectedLanguage = val;
                        setState((){});
                      },
                    );
                  },
                  separatorBuilder: (ctx, i) {
                    return const DividerWidget();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
