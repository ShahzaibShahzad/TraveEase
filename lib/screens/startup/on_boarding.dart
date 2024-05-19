import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_book/generated/assets.dart';
import 'package:travel_book/models/onboarding_model.dart';
import 'package:travel_book/screens/auth/signin.dart';
import 'package:travel_book/widgets/primary_button_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utility_extensions/utility_extensions.dart';
import '../../extras/app_textstyle.dart';
import '../../extras/colors.dart';
import '../../widgets/margin_widget.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {

  late double width, height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          sliderWidget(),
        ],
      ),
    );
  }

  CarouselController controller = CarouselController();


  Widget sliderWidget() {
    List<OnBoardingModel> items = [
      OnBoardingModel(
        heading: "Let's Explore the Italy".tr,
        description: "Let’s explore the Italy with us with just a few clicks".tr,
        image: Assets.imagesOnboarding1,
        buttonText: "Next".tr,
      ),
      OnBoardingModel(
        heading: "Visit tourist attractions".tr,
        description:
            "Find thousands of tourist destinations ready for you to visit".tr,
        image: Assets.imagesOnboarding2,
        buttonText: "Next".tr,
      ),
      OnBoardingModel(
        heading: "Get ready for next trip".tr,
        description:
            "Find thousands of tourist destinations ready for you to visit".tr,
        image: Assets.imagesOnboarding3,
        buttonText: "Get Started".tr,
      ),
    ];
    return CarouselSlider.builder(
      carouselController: controller,
      itemCount: 3,
      itemBuilder: (ctx, index, realIndex) {
        return sliderItemWidget(items[index], index);
      },
      options: CarouselOptions(
        height: double.infinity,
        viewportFraction: 1,
        scrollPhysics: const NeverScrollableScrollPhysics(),
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: false,
        autoPlayCurve: Curves.easeInOut,
        enlargeCenterPage: false,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget sliderItemWidget(OnBoardingModel model, int index) {

    return Stack(
      children: [
        Image(
          image: AssetImage(
            model.image,
          ),
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned.fill(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Column(
                  children: [
                    Text(model.heading,
                      style: AppTextStyle.cobblerSans(
                          color: CColors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w700,
                        ),
                    ),
                    const VMarginWidget(factor: 1,),
                    Text(model.description,
                      style: AppTextStyle.cobblerSans(
                          color: CColors.white,
                          fontSize: 17,
                      ),
                    ),
                    const VMarginWidget(factor: 1,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03,),
                      child: Row(
                        children: [
                          progressWidget(index == 0 ? 1 : 2),
                          SizedBox(width: width * 0.015,),
                          progressWidget(index == 1 ? 1 : index < 1 ? 0 : 2),
                          SizedBox(width: width * 0.015,),
                          progressWidget(index == 2 ? 1 : index < 2 ? 0 : 2),
                        ],
                      ),
                    ),
                  ],
                ),
                const VMarginWidget(factor: 2,),
                PrimaryButton(
                  text: model.buttonText,
                  onPressed: () async {
                    if(index != 2){
                      controller.animateToPage(index + 1);
                    }else{


                      var pref = await SharedPreferences.getInstance();
                      pref.setBool("NewDownload", false);

                      context.pushReplacement(child: const SignIn());
                    }
                  },
                ),

                const VMarginWidget(),
              ],
            ),
          ),
        ),
      ],
    );
  }


  Widget progressWidget(int state){
    return Expanded(
      child: LinearProgressIndicator(
        value: state == 1 ? 0.5 : state == 0 ? 0 : 1,
        backgroundColor: Colors.white.withOpacity(0.5,),
        color: Colors.white,

      ),
    );
  }
}
