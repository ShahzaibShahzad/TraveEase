import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_book/screens/dashboard/dashboard.dart';
import 'package:travel_book/widgets/back_button_widget.dart';
import 'package:travel_book/widgets/margin_widget.dart';
import 'package:utility_extensions/utility_extensions.dart';
import '../../extras/app_textstyle.dart';
import '../../extras/colors.dart';
import '../../widgets/primary_button_widget.dart';
import '../../widgets/text_field_widget.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.receiveEmails,
      Key? key})
      : super(key: key);

  final String firstName, lastName, email;
  final bool receiveEmails;

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  var password = TextEditingController();
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
                ' Create your Account'.tr,
                style: AppTextStyle.cobblerSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: CColors.grey4,
                ),
              ),
              const VMarginWidget(
                factor: 0.2,
              ),
              Text(
                "Create a Password".tr,
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
              Text(
                'Your password must include at least one symbol and be 8 or more characters long.'
                    .tr
                    .tr,
                style: AppTextStyle.cobblerSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: CColors.grey3,
                ),
              ),
              const VMarginWidget(
                factor: 2,
              ),
              LinearProgressIndicator(
                value: 0.75,
                backgroundColor: Colors.transparent,
                color: CColors.black,
              ),
              const VMarginWidget(
                factor: 1,
              ),
              PrimaryButton(
                text: 'Verification'.tr,
                onPressed: () {
                  createAccount();

                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  createAccount() {
    context.pushAndRemoveUntil(child: Dashboard());
  }
}
