import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:travel_book/extras/app_textstyle.dart';
import 'package:travel_book/providers/data_provider.dart';
import 'package:travel_book/screens/auth/signin.dart';
import 'package:travel_book/widgets/back_button_widget.dart';
import 'package:travel_book/widgets/margin_widget.dart';
import 'package:utility_extensions/utility_extensions.dart';
import '../../../extras/functions.dart';
import '../../../generated/assets.dart';
import '../../../models/user_model.dart';
import '../../../widgets/primary_button_widget.dart';
import '../../../widgets/profile_textfield_widget.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var location = TextEditingController();
  var email = TextEditingController();
  late double width;

  String? image;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Consumer<DataProvider>(builder: (context, value, child) {

        firstName.text = "Profile";
        lastName.text = "";
        location.text = "Australia";
        email.text = "test@gmail.com";
        location.text = "Location";




      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VMarginWidget(
                  factor: 3,
                ),
                const BackButtonWidget(),
                const VMarginWidget(),
                Text(
                  "PROFILE SETTING".tr,
                  style: AppTextStyle.cobblerSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Update Your Profile".tr,
                  style: AppTextStyle.cobblerSans(
                      fontSize: 21, fontWeight: FontWeight.w600),
                ),
                const VMarginWidget(
                  factor: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipOval(
                      child: Image(
                        image: image != null
                            ? NetworkImage(image!)
                            : const AssetImage(Assets.imagesPlaceholder)
                                as ImageProvider,
                        height: 65,
                        width: 65,
                      ),
                    ),
                    SizedBox(
                      width: 129,
                      height: 39,
                      child: PrimaryButton(
                        text: 'New Picture'.tr,
                        onPressed: () {
                          getImage();
                        },
                      ),
                    ),
                  ],
                ),
                const VMarginWidget(
                  factor: 1,
                ),
                ProfileTextFieldWidget(
                  hint: 'First Name'.tr,
                  controller: firstName,
                ),
                const VMarginWidget(),
                ProfileTextFieldWidget(
                  hint: "Last Name".tr,
                  controller: lastName,
                ),
                const VMarginWidget(),
                ProfileTextFieldWidget(
                  hint: "Location".tr,
                  controller: location,
                ),
                const VMarginWidget(),
                ProfileTextFieldWidget(
                  hint: "Email".tr,
                  controller: email,
                  readOnly: true,
                ),
                const VMarginWidget(),
                PrimaryButton(
                  text: "Save".tr,
                  onPressed: () {
                    if (firstName.text.trim().isEmpty) {
                      Functions.showSnackBar(
                        context,
                        "${"Please enter your".tr} ${"First Name".tr}",
                      );
                    } else {
                      updateData();
                    }
                  },
                ),
                const VMarginWidget(),
                PrimaryButton(
                  text: "Delete Account".tr,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Delete Account"),
                          content: const Text(
                              "Are you sure you want to delete your account?"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () async {

                                Functions.showSnackBar(
                                    context, "Account Successfully deleted");
                              },
                              child: const Text("Yes"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("No"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Future<void> deleteBookings(String id) async {

  }

  // UserModel currentData;

  updateData() {

  }

  File? imageFile;

  getImage() async {
    var imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageFile != null) {

    }
  }

  updateImage(String link) {

  }
}
