import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../extras/app_textstyle.dart';
import '../../extras/colors.dart';
import '../../extras/functions.dart';
import '../../widgets/back_button_widget.dart';
import '../../widgets/margin_widget.dart';
import '../../widgets/primary_button_widget.dart';
import '../../widgets/text_field_widget.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  var email = TextEditingController();
  var node = FocusNode();
  late double width;
  String? emails;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VMarginWidget(
                factor: 4,
              ),
              const BackButtonWidget(),
              const VMarginWidget(
                factor: 3,
              ),
              Text(
                'Input your Email'.tr,
                style: AppTextStyle.cobblerSans(
                    fontSize: 16,
                    color: CColors.grey4,
                  ),
              ),
              const VMarginWidget(
                factor: 0.2,
              ),
              Text(
                'Forgot your password?'.tr,
                style: AppTextStyle.cobblerSans(
                    fontSize: 29,
                    fontWeight: FontWeight.w600,
                ),
              ),
              const VMarginWidget(
                factor: 3,
              ),
              TextFieldWidget(
                controller: email,
                isLast: true,
                label: 'Email'.tr,

              ),
              const VMarginWidget(
                factor: 5,
              ),
              PrimaryButton(
                text: 'Submit'.tr,
                onPressed: () async {
                  Functions.showSnackBar(context,
                      "Password reset has been sent. Please check your email.");

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
