// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:travel_book/extras/app_textstyle.dart';
import 'package:travel_book/extras/constant.dart';
import 'package:travel_book/models/tour_model.dart';
import 'package:travel_book/models/user_model.dart';
import 'package:travel_book/screens/auth/signin.dart';
import 'package:travel_book/screens/dashboard/bookings/bookings.dart';
import 'package:travel_book/screens/dashboard/profile/about_us.dart';
import 'package:travel_book/screens/dashboard/profile/gallery.dart';
import 'package:travel_book/screens/dashboard/profile/help.dart';
import 'package:travel_book/screens/dashboard/profile/languages.dart';
import 'package:travel_book/screens/dashboard/profile/privacy_policy.dart';
import 'package:travel_book/screens/dashboard/profile/push_notification.dart';
import 'package:travel_book/screens/dashboard/profile/settings.dart';
import 'package:travel_book/widgets/margin_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utility_extensions/utility_extensions.dart';
import '../../extras/colors.dart';
import '../../generated/assets.dart';
import '../../providers/data_provider.dart';
import '../../widgets/discount_widget.dart';
import '../../widgets/divider_widget.dart';
import '../../widgets/heading_widget.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/tour_ticket_widget.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late double width, height;
  late EdgeInsets padding;
  late DataProvider provider;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    padding = EdgeInsets.symmetric(
      horizontal: width * 0.05,
    );
    return Consumer<DataProvider>(builder: (context, provider, child) {
      this.provider = provider;

      List<TourModel> tours = [Constants.tour,Constants.tour,Constants.tour];
      // for (var booking in provider.tourBookings) {
      //   for (var tour in provider.tours) {
      //     if (booking.userID == FirebaseAuth.instance.currentUser!.uid &&
      //         booking.type == "Tour" &&
      //         booking.tourID == tour.id) {
      //       tours.add(tour);
      //     }
      //   }
      // }
      // if (provider.userModel == null) {
      //   return const Center(
      //     child: LoadingWidget(),
      //   );
      // }

      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VMarginWidget(),
            profileWidget(),
            const VMarginWidget(),
            overviewWidget(),
            const VMarginWidget(
              factor: 1.2,
            ),
            if (tours.isNotEmpty) ...[
              Container(
                padding: padding,
                child: HeadingWidget(
                  text: "My Trip History".tr,
                ),
              ),
              const VMarginWidget(
                factor: 0.5,
              ),
              tourAndTicketWidget(tours),
              const VMarginWidget(),
            ],
            Container(
              padding: padding,
              child: const DiscountWidget(),
            ),
            const VMarginWidget(),
            bottomWidget(),
            const VMarginWidget(),
          ],
        ),
      ).removeScrollEffect();
    });
  }

  Widget profileWidget() {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          const ClipOval(
            child: Image(
              image: AssetImage(
                Assets.imagesPlaceholder,
              ),
              height: 65,
              width: 65,
            ),
          ),
          Expanded(
            child: Padding(
              padding: padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${Constants.user.firstName}  ${Constants.user.lastName}",
                    style: AppTextStyle.cobblerSans(
                      color: CColors.black,
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                    Row(
                      children: [
                        Image(
                          image: const AssetImage(Assets.iconsLocationPin),
                          color: CColors.grey4,
                          width: 7,
                        ),
                        const HMarginWidget(
                          factor: 0.3,
                        ),
                        Text(
                          Constants.user.location,
                          style: AppTextStyle.cobblerSans(
                            color: CColors.grey4,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              context.push(child: const ProfileSettings());
            },
            child: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: CColors.primary,
                borderRadius: BorderRadius.circular(
                  12,
                ),
              ),
              child: Icon(
                IconlyBold.setting,
                color: CColors.white,
                size: 36,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget overviewWidget() {
    UserModel? user = Constants.user;
    return Padding(
      padding: padding,
      child: Row(
        children: [
          overviewItemWidget(
            "Trips".tr,
            "3",
          ),
          overviewItemWidget(
            "Favourites".tr,
            "3",
            // "${user!.fBlogs.length + user.fNews.length + user.fOffers.length + user.fStays.length + user.fTours.length}",
          ),
          overviewItemWidget(
            "Photos".tr,
            "3",
          ),
        ],
      ),
    );
  }

  bool tourExist(String id) {
    List list = provider.tours.where((element) => element.id == id).toList();
    return list.isNotEmpty;
  }

  bool stayExist(String id) {
    List list = provider.stays.where((element) => element.id == id).toList();
    return list.isNotEmpty;
  }

  bool offerExist(String id) {
    List list =
        provider.specialOffers.where((element) => element.id == id).toList();
    return list.isNotEmpty;
  }

  bool blogExist(String id) {
    List list = provider.blogs.where((element) => element.id == id).toList();
    return list.isNotEmpty;
  }

  bool newsExist(String id) {
    List list = provider.news.where((element) => element.id == id).toList();
    return list.isNotEmpty;
  }

  int getFavourites() {
    int count = 0;

    for (var element in provider.userModel!.fTours) {
      if (tourExist(element)) {
        count++;
      }
    }
    for (var element in provider.userModel!.fStays) {
      if (stayExist(element)) {
        count++;
      }
    }
    for (var element in provider.userModel!.fOffers) {
      if (offerExist(element)) {
        count++;
      }
    }
    for (var element in provider.userModel!.fBlogs) {
      if (blogExist(element)) {
        count++;
      }
    }
    for (var element in provider.userModel!.fNews) {
      if (newsExist(element)) {
        count++;
      }
    }

    return count;
  }

  Widget overviewItemWidget(String heading, String text) {
    return Expanded(
      child: Column(
        children: [
          HeadingWidget(
            text: text,
          ),
          Text(
            heading,
            style: AppTextStyle.cobblerSans(
                color: CColors.grey4,
                fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomWidget() {
    return Padding(
      padding: padding,
      child: Column(
        children: [
          itemTile(
              data: Assets.iconsGallery,
              title: "My Gallery".tr,
              onPressed: () {
                context.push(child: const Gallery());
              }),
          const DividerWidget(),
          itemTile(
              data: IconlyLight.notification,
              title: "Notification".tr,
              onPressed: () {
                context.push(child: const PushNotification());
              }),
          const DividerWidget(),
          itemTile(
              data: Icons.language,
              title: "Language".tr,
              onPressed: () {
                context.push(child: const Languages());
              }),
          const DividerWidget(),
          itemTile(
              data: Assets.booking,
              title: "Bookings".tr,
              onPressed: () {
                context.push(child: const BookingsScreen());
              }),
          const DividerWidget(),
          itemTile(
            data: IconlyLight.setting,
            title: "Settings".tr,
            onPressed: () {
              context.push(child: const ProfileSettings());
            },
          ),
          const DividerWidget(),
          itemTile(
              data: IconlyLight.info_circle,
              title: "About Us".tr,
              onPressed: () {
                context.push(child: const AboutUs());
              }),
          const DividerWidget(),
          itemTile(
              data: IconlyLight.logout,
              title: "Logout".tr,
              onPressed: () async {

                context.pushAndRemoveUntil(child: const SignIn());
              }),
          const DividerWidget(),
        ],
      ),
    );
  }

  Widget itemTile({
    required var data,
    required String title,
    required Function() onPressed,
  }) {
    return ListTile(
      dense: true,
      visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
      onTap: onPressed,
      contentPadding: EdgeInsets.zero,
      leading: data is IconData
          ? Icon(
              data,
              color: CColors.primary,
            )
          : ImageIcon(
              AssetImage(data),
              color: CColors.primary,
            ),
      title: Text(
        title,
        style: AppTextStyle.urbanist(
            style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: CColors.black,
        )),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: CColors.grey2,
      ),
    );
  }

  Widget tourAndTicketWidget(List<TourModel> tours) {
    if (tours.isEmpty) {
      return const Text("No Trip History Yet");
    }

    print("tours length ${tours.length}");

    return SizedBox(
      height: 200,
      child: ListView.separated(
        padding: padding,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, i) {
          return TourTicketWidget(
            index: i,
            model: tours[i],
          );
        },
        separatorBuilder: (ctx, i) {
          return const HMarginWidget();
        },
        itemCount: tours.length,
      ).removeScrollEffect(),
    );
  }
}
