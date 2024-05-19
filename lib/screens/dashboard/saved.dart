import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:travel_book/extras/app_textstyle.dart';
import 'package:travel_book/extras/colors.dart';
import 'package:travel_book/extras/constant.dart';
import 'package:travel_book/providers/data_provider.dart';
import 'package:travel_book/widgets/widget_slides.dart';
import '../../widgets/margin_widget.dart';
import '../../widgets/save_blog_widget.dart';
import '../../widgets/save_stays_widget.dart';
import '../../widgets/save_tours_widget.dart';

class Saved extends StatefulWidget {
  const Saved({Key? key}) : super(key: key);

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  String selectedText = "Tours".tr;
  late double width;

  late DataProvider provider;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Consumer<DataProvider>(builder: (context, value, child) {
      provider = value;
      return Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topWidget(),
              const VMarginWidget(),
              Expanded(
                child: selectedText == "Tours".tr
                    ? tourWidget()
                    : selectedText == "Stays".tr
                        ? staysWidget()
                        : selectedText == "Blog".tr
                            ? blogWidget()
                            : Container(),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget tourWidget() {
    var list = [Constants.tour, Constants.tour];
    return ListView.separated(
      itemCount: list.length,
      itemBuilder: (context, inx) {
        return SaveToursWidget(
          model: list[inx],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const VMarginWidget();
      },
    );
  }

  Widget staysWidget() {
    var list = [Constants.stay,Constants.stay];
    return ListView.separated(
      itemCount: list.length,
      itemBuilder: (ctx, inx) {
        return SaveStaysWidget(
          model: list[inx],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const VMarginWidget();
      },
    );
  }

  Widget blogWidget() {
    var list = [Constants.travelBlog,Constants.travelBlog];

    return ListView.separated(
      itemCount: list.length,
      itemBuilder: (context, inx) {
        return SaveBlogWidget(
          model: list[inx],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const VMarginWidget();
      },
    );
  }





  Widget topWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VMarginWidget(
          factor: 1,
        ),
        Text(
          "FAVOURITE".tr,
          style: AppTextStyle.cobblerSans(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: CColors.grey4,
          ),
        ),
        Text(
          "Recently Saved".tr,
          style: AppTextStyle.cobblerSans(
              fontSize: 21,
              fontWeight: FontWeight.w600,
            ),
        ),
        SlideWidget(onTap: (val){
          setState(() {
            selectedText = val;
          });
        }, selectedText: selectedText)
      ],
    );
  }
}
