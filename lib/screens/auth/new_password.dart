import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_book/extras/app_textstyle.dart';
import 'package:travel_book/extras/colors.dart';
import 'package:travel_book/widgets/back_button_widget.dart';
import 'package:travel_book/widgets/margin_widget.dart';
import 'package:travel_book/widgets/text_field_widget.dart';
import 'package:utility_extensions/utility_extensions.dart';
import '../../widgets/primary_button_widget.dart';
import '../dashboard/dashboard.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  var password = TextEditingController();
  var confirmPassword = TextEditingController();
  late double width;

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
                factor: 2,
              ),
              Text(
                'Forgot Password?'.tr,
                style: AppTextStyle.cobblerSans(
                    color: CColors.grey4,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                ),
              ),
              const VMarginWidget(
                factor: 0.2,
              ),
              Text(
                'Create New Password'.tr,
                style: AppTextStyle.cobblerSans(
                    fontSize: 29,
                    fontWeight: FontWeight.w600,
                  ),
              ),
              const VMarginWidget(
                factor: 3,
              ),
              TextFieldWidget(
                controller: password,
                label: 'Password'.tr,
                obscureText: true,
                isLast: true,
              ),
              const VMarginWidget(
                factor: 1,
              ),
              TextFieldWidget(
                controller: confirmPassword,
                label: 'Password'.tr,
                obscureText: true,
                isLast: true,
              ),
              const VMarginWidget(
                factor: 1,
              ),
              Text(
                'Your password must include at least'
                        ' one symbol and be 8 or more characters long.'
                    .tr,
                style: AppTextStyle.cobblerSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: CColors.grey3,
                ),
              ),
              const VMarginWidget(
                factor: 7,
              ),
              PrimaryButton(
                text: 'Save'.tr,
                onPressed: () {
                  context.push(
                    child:  const Dashboard(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
