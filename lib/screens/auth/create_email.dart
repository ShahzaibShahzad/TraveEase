
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_book/widgets/back_button_widget.dart';
import 'package:travel_book/widgets/margin_widget.dart';
import 'package:travel_book/widgets/text_field_widget.dart';
import 'package:utility_extensions/utility_extensions.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../../extras/app_textstyle.dart';
import '../../extras/colors.dart';
import '../../widgets/primary_button_widget.dart';
import 'create_password.dart';

class CreateEmail extends StatefulWidget {
  const CreateEmail({required this.firstName, required this.lastName, Key? key})
      : super(key: key);

  final String firstName, lastName;

  @override
  State<CreateEmail> createState() => _CreateNameState();
}

class _CreateNameState extends State<CreateEmail> {
  var email = TextEditingController();
  late double width;
  bool receiveEmails = false;

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
                "What's is Your Email?".tr,
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
                label: 'Email'.tr,
              ),
              const VMarginWidget(
                factor: 1,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "i'd like to received marketing and policy communication from Rome Italy Travel and its partners."
                          .tr,
                      style: AppTextStyle.cobblerSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: CColors.grey3),
                    ),
                  ),
                  FlutterSwitch(
                    width: 54,
                    height: 29,
                    padding: 2,
                    toggleColor: CColors.black,
                    activeColor: CColors.white,
                    inactiveColor: CColors.white,
                    switchBorder: Border.all(
                      color: CColors.grey2,
                      width: 1,
                    ),
                    value: receiveEmails,
                    onToggle: (bool value) {
                      setState(() {
                        receiveEmails = value;
                      });
                    },
                  ),
                ],
              ),
              const VMarginWidget(
                factor: 2,
              ),
              LinearProgressIndicator(
                value: 0.5,
                backgroundColor: Colors.transparent,
                color: CColors.black,
              ),
              const VMarginWidget(
                factor: 1,
              ),
              PrimaryButton(
                text: 'Create Password'.tr,
                onPressed: () async {
                  context.push(
                    child: CreatePassword(
                      firstName: widget.firstName,
                      lastName: widget.lastName,
                      email: email.text,
                      receiveEmails: receiveEmails,
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
