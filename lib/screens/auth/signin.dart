import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:travel_book/extras/app_textstyle.dart';
import 'package:travel_book/extras/functions.dart';
import 'package:travel_book/generated/assets.dart';
import 'package:travel_book/screens/auth/create_account.dart';
import 'package:utility_extensions/utility_extensions.dart';
import '../../extras/colors.dart';
import '../../widgets/margin_widget.dart';
import '../../widgets/primary_button_widget.dart';
import '../../widgets/secondary_button_widget.dart';
import '../../widgets/social_button.dart';
import '../../widgets/text_field_widget.dart';
import '../dashboard/dashboard.dart';
import 'forgot_password.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool isCheck = false;
  var email = TextEditingController();
  var password = TextEditingController();
  var focusNode = FocusNode();

  late double width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: CColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
            ),
            child: Column(
              children: [
                const VMarginWidget(
                  factor: 4,
                ),
                const SizedBox(
                  width: 150,
                  child: Image(
                    image: AssetImage(Assets.imagesLogo),
                  ),
                ),
                const VMarginWidget(
                  factor: 2,
                ),
                TextFieldWidget(
                  controller: email,
                  label: 'Email'.tr,
                ),
                const VMarginWidget(
                  factor: 1,
                ),
                TextFieldWidget(
                  controller: password,
                  isLast: true,
                  label: 'Password'.tr,
                  obscureText: true,
                ),
                const VMarginWidget(
                  factor: 0.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {
                        context.push(
                          child: const ForgotPassword(),
                        );
                      },
                      child: Text(
                        'Forgot password?'.tr,
                        style: AppTextStyle.cobblerSans(
                          color: CColors.grey3,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const VMarginWidget(
                  factor: 3.5,
                ),
                SecondaryButton(
                  text: 'Create Account'.tr,
                  onPressed: () {
                    context.push(child: const CreateAccount());
                  },
                ),
                const VMarginWidget(
                  factor: 1,
                ),
                PrimaryButton(
                  text: 'Sign in'.tr,
                  onPressed: () {
                    Functions.showLoading(context);
                    signIn();
                  },
                ),
                const VMarginWidget(
                  factor: 2,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.08,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.25),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image(
                              image: AssetImage(Assets.apple),
                            ),
                          ),
                        ),
                      ),
                      SocialButton(
                        image: Assets.iconsGoogle,
                        onPressed: () {
                          context.pushAndRemoveUntil(child: const Dashboard());
                        },
                      ),
                      SocialButton(
                        image: Assets.iconsFacebook,
                        onPressed: () {
                          context.pushAndRemoveUntil(child: const Dashboard());
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signIn() {
    context.pushAndRemoveUntil(child: const Dashboard());
  }
}

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SignInView();
  }
}
