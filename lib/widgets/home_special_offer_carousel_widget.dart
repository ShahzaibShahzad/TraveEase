import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_book/extras/app_textstyle.dart';
import 'package:travel_book/extras/colors.dart';
import 'package:travel_book/providers/data_provider.dart';
import 'package:travel_book/widgets/special_offer_widget.dart';

import '../models/special_offer_model.dart';

class HomeCarouselWidget extends StatefulWidget {
  final List<SpecialOfferModel> specialOffers;

  const HomeCarouselWidget({super.key, required this.specialOffers});

  @override
  State<HomeCarouselWidget> createState() => _HomeCarouselWidgetState();
}

class _HomeCarouselWidgetState extends State<HomeCarouselWidget> {
  var length = 10;

  int index = 0;

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    length = widget.specialOffers.length;
    if (length == 0) {
      return SizedBox();
    }
    return Stack(
      children: [

        CarouselSlider.builder(
          itemCount: length,
          itemBuilder: (ctx, index, realIndex) {
            return SpecialOfferWidget(model: widget.specialOffers[index]);
          },
          options: CarouselOptions(
              aspectRatio: 0.92,
              viewportFraction: 1,
              autoPlay: false,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  this.index = index;
                });
              }),
        ),
        // Positioned(
        //   bottom: 60,
        //   left: 20,
        //   child: SizedBox(
        //     width: 250,
        //     // padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: height * 0.025,),
        //     child: Text(
        //       "Get FREE entrance with your app",
        //       style: AppTextStyle.urbanist(
        //           style: const TextStyle(
        //             fontSize: 21,
        //             fontWeight: FontWeight.w700,
        //             color: Colors.white,
        //           )),
        //     ),
        //   ),
        // ),
        Positioned(
          left: 10,
          right: 10,
          bottom: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...dotsWidget(),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> dotsWidget() {
    return [
      for (int i = 0; i < length; i++)
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 2,
          ),
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: index == i ? Colors.white : CColors.grey3,
            shape: BoxShape.circle,
          ),
        ),
    ];
  }
}
