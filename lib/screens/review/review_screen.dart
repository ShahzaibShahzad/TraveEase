import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:travel_book/models/review_model.dart';
import 'package:travel_book/providers/data_provider.dart';

import '../../widgets/review_widget.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({required this.list, Key? key}) : super(key: key);

  final List<ReviewModel> list;

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {

  late double width, height;
  late DataProvider provider;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Consumer<DataProvider>(
        builder: (context, value, child) {
      provider = value;
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:  Text("Review Screen".tr),
        ),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: width* 0.08),
          child: ListView.builder(
            itemBuilder: (ctx, i) {
              return ReviewWidget(model: widget.list[i],
              ); //const ReviewWidget();
            },
            itemCount: widget.list.length,
          ),
        ),
      );
    });
  }
}
