import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../extras/colors.dart';
import '../generated/assets.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({required this.images, Key? key}) : super(key: key);

  final List<String> images;
  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  var length = 10;
  int index = 0;


  @override
  void initState() {
    length = widget.images.length;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: length,
          itemBuilder: (ctx, index, realIndex) {
            return Stack(
              children: [
                if(widget.images.isNotEmpty)...[
                Image(
                  image: NetworkImage(widget.images[index]),
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                ]else...[
            if(widget.images.isEmpty)...[
             const Image( image: AssetImage(Assets.placeholder1),
                 width: double.infinity,
                 height: double.infinity,
                 fit: BoxFit.cover,)
                ],
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.1,),
                  ),
                ),
              ],
            ]
            );
          },
          options: CarouselOptions(
              height: double.infinity,
              viewportFraction: 1,
              autoPlay: false,
              enlargeCenterPage: true,
              onPageChanged: (index, reason){
                setState(() {
                  this.index = index;
                });
              }
          ),
        ),
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
      for(int i = 0 ; i < length ; i++)
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 6,),
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
