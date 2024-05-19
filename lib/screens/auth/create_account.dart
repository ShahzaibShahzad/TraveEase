import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_book/extras/app_textstyle.dart';
import 'package:travel_book/extras/colors.dart';
import 'package:travel_book/extras/functions.dart';
import 'package:travel_book/widgets/back_button_widget.dart';
import 'package:travel_book/widgets/margin_widget.dart';
import 'package:travel_book/widgets/text_field_widget.dart';
import 'package:utility_extensions/utility_extensions.dart';
import '../../widgets/primary_button_widget.dart';
import 'create_email.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  var firstName = TextEditingController();
  var lastName = TextEditingController();
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
                "What's is Your name?".tr,
                style: AppTextStyle.cobblerSans(
                  fontSize: 29,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const VMarginWidget(
                factor: 3,
              ),
              TextFieldWidget(controller: firstName, label: 'First Name'.tr),
              const VMarginWidget(
                factor: 1,
              ),
              TextFieldWidget(
                controller: lastName,
                label: 'Last Name'.tr,
              ),
              const VMarginWidget(
                factor: 1,
              ),
              LinearProgressIndicator(
                value: 0.25,
                backgroundColor: Colors.transparent,
                color: CColors.black,
              ),
              const VMarginWidget(
                factor: 1,
              ),
              PrimaryButton(
                text: 'Input Email'.tr,
                onPressed: () {
                  context.push(
                    child: CreateEmail(
                      firstName: firstName.text,
                      lastName: lastName.text,
                    ),
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
