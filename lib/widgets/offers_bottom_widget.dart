import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:travel_book/screens/dashboard/home/news_screen.dart';
import 'package:utility_extensions/utility_extensions.dart';
import '../extras/app_textstyle.dart';
import '../extras/colors.dart';
import '../generated/assets.dart';
import '../models/news_model.dart';
import 'margin_widget.dart';
class OffersBottomWidget extends StatelessWidget {
  OffersBottomWidget({required this.index, Key? key}) : super(key: key);

  final int index;
  late double width, height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return AspectRatio(
      aspectRatio: 0.75,
      child: InkWell(
        // onTap: ()=> context.push(child: NewsScreen(model: model,)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12,),
          child: Stack(
            children: [
              Image(
                image: AssetImage(index % 2 == 0 ? Assets.imagesDemot1 : Assets.imagesDemot2,),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned.fill(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.015, vertical: height * 0.01,),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black,
                      ],
                      stops: [
                        0.75,
                        1.0,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: FloatingActionButton(
                            heroTag: "tb$index",
                            onPressed: (){

                            },
                            backgroundColor: CColors.white,
                            child: Icon(IconlyLight.bookmark, color: CColors.grey3, size: 10,),
                          ),
                        ),
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("30% OFF in Florence",
                            maxLines: 1,
                            style: AppTextStyle.urbanist(
                              style: TextStyle(
                                color: CColors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const VMarginWidget(factor: 0.1,),
                          Text("Tipsy Tour inflo".tr,
                            style: AppTextStyle.urbanist(
                              style: TextStyle(
                                color: CColors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                          const VMarginWidget(factor: 0.1,),
                          Text("Tipsy Tour".tr,
                            style: AppTextStyle.urbanist(
                              style: TextStyle(
                                color: CColors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
