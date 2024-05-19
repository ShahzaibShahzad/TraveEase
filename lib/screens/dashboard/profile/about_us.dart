import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../extras/app_textstyle.dart';
import '../../../extras/colors.dart';
import '../../../generated/assets.dart';
import '../../../widgets/back_button_widget.dart';
import '../../../widgets/choose_us_widget.dart';
import '../../../widgets/margin_widget.dart';
import '../../../widgets/primary_button_widget.dart';
import '../../../widgets/social_button.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  bool isCheck = false;
  late double width, height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VMarginWidget(
                factor: 2,
              ),
              const BackButtonWidget(),
              const VMarginWidget(
                factor: 0.6,
              ),
              Text(
                "About Us".tr,
                style: AppTextStyle.cobblerSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const VMarginWidget(),
              AspectRatio(
                aspectRatio: 1.12 / 1.43,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: const Image(
                    image: AssetImage(
                      Assets.about,
                    ),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const VMarginWidget(),
              Text(
                "Lorem ipsum dolor sit amet",
                style: AppTextStyle.cobblerSans(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const VMarginWidget(factor: 0.5),
              Text(
                "Lorem ipsum dolor sit amet consectetur. Nec egestas velit pellentesque dui lorem senectus vitae amet auctor. Sem sed semper enim neque nam morbi purus scelerisque non. Mauris non et viverra mauris purus nec. Amet pharetra amet elementum nulla sit ut. Non sit tortor aenean volutpat eget purus ultrices.",
                style: AppTextStyle.cobblerSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const VMarginWidget(),
              AspectRatio(
                aspectRatio: 1.80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: const Image(
                    image: AssetImage(
                      Assets.nearAbout,
                    ),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const VMarginWidget(),
              Text(
                "Lorem ipsum dolor",
                style: AppTextStyle.cobblerSans(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const VMarginWidget(factor: 0.5),
              Text(
                "Lorem ipsum dolor sit amet consectetur. Nec egestas velit pellentesque dui lorem senectus vitae amet auctor. Sem sed semper enim neque nam morbi purus scelerisque non. Mauris non et viverra mauris purus nec. Amet pharetra amet elementum nulla sit ut. Non sit tortor aenean volutpat eget purus ultrices.",
                style: AppTextStyle.cobblerSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const VMarginWidget(),
              AspectRatio(
                aspectRatio: 1.80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: const Image(
                    image: AssetImage(
                      Assets.nearMe,
                    ),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const VMarginWidget(),
              Text(
                "Why choose us?",
                style: AppTextStyle.cobblerSans(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const VMarginWidget(),
              ChooseUsWidget(),
              const VMarginWidget(),
              aboutUaBottom(),
              const VMarginWidget(
                factor: 1,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: CColors.primary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image(
                            image: const AssetImage(Assets.apple),
                            color: CColors.white,
                          ),
                        ),
                      ),
                    ),
                    SocialButton(
                      image: Assets.googleIcon,
                      onPressed: () {},
                    ),
                    SocialButton(
                      image: Assets.fbIcon,
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget aboutUaBottom() {
    return AspectRatio(
      aspectRatio: 1.49 / 1.46,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(9),
            child: const Image(
              image: AssetImage(
                Assets.friend,
              ),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.07,
              ),
              decoration: const BoxDecoration(),
              child: Column(
                children: [
                  const VMarginWidget(
                    factor: 7,
                  ),
                  Text(
                    "Refer friends. Get rewards.",
                    style: AppTextStyle.urbanist(
                        style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
                      color: CColors.white,
                    )),
                  ),
                  // const VMarginWidget(factor: 0.1,),
                  Text(
                    "Give your friends 20% off all products. Get 20% off all products when they shop with your link.",
                    style: AppTextStyle.urbanist(
                        style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: CColors.white,
                    )),
                  ),
                  const VMarginWidget(
                    factor: 0.5,
                  ),
                  const PrimaryButton(
                    text: 'Invite a friend',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
