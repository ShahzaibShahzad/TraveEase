import 'package:clipboard/clipboard.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:travel_book/extras/constant.dart';
import 'package:travel_book/providers/data_provider.dart';
import 'package:travel_book/widgets/stay_booking_dialog.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:utility_extensions/utility_extensions.dart';
import '../../../extras/app_textstyle.dart';
import '../../../extras/colors.dart';
import '../../../extras/functions.dart';
import '../../../generated/assets.dart';
import '../../../models/stay_model.dart';
import '../../../widgets/details_top_widget.dart';
import '../../../widgets/dialog_widget.dart';
import '../../../widgets/divider_widget.dart';
import '../../../widgets/heading_widget.dart';
import '../../../widgets/map_widget.dart';
import '../../../widgets/margin_widget.dart';
import '../../../widgets/primary_button_widget.dart';
import '../../../widgets/review_widget.dart';
import '../../../widgets/stay_widget.dart';
import '../../../widgets/text_tile_widget.dart';
import '../../review/review_screen.dart';

class StaysScreen extends StatefulWidget {
  StaysScreen({required this.model, Key? key}) : super(key: key);
  StayModel model;

  @override
  State<StaysScreen> createState() => _StaysScreenState();
}

class _StaysScreenState extends State<StaysScreen> {
  late double width, height;
  late EdgeInsets padding;

  double rating = 0.0;

  late DataProvider provider;

  bool showAll = true;

  bool mapWidgetVal = true;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    padding = EdgeInsets.symmetric(
      horizontal: width * 0.05,
    );
    return Consumer<DataProvider>(builder: (context, value, child) {
      provider = value;
      rating = Functions.getRating(widget.model.reviews!);

      return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  DetailsTopWidget(
                    rating: widget.model.rating!,
                    images: widget.model.images!,
                    isCheck: true,
                    onTap: () {},
                    onpress: () {},
                  ).toSliver,
                  const VMarginWidget(
                    isSLiver: true,
                  ),
                  detailsWidget().toSliver,
                  const VMarginWidget(
                    isSLiver: true,
                    factor: 0.5,
                  ),
                  aboutWidget().toSliver,
                  // const VMarginWidget(
                  //   isSLiver: true,
                  // ),
                  descriptionWidget().toSliver,
                  const VMarginWidget(
                    isSLiver: true,
                  ),
                  facilityWidget().toSliver,
                  const VMarginWidget(
                    isSLiver: true,
                  ),
                  checkInWidget().toSliver,
                  const VMarginWidget(
                    isSLiver: true,
                  ),
                  locationWidget().toSliver,
                  const VMarginWidget(
                    isSLiver: true,
                  ),
                  reviewsOverviewWidget().toSliver,
                  const VMarginWidget(
                    isSLiver: true,
                    factor: 0.3,
                  ),
                  reviewList(),
                  const VMarginWidget(
                    factor: 0.5,
                    isSLiver: true,
                  ),
                  seeAllReviewsWidget().toSliver,
                  const VMarginWidget(
                    factor: 0.7,
                    isSLiver: true,
                  ),
                  Padding(
                    padding: padding,
                    child: HeadingWidget(
                      text: "You might also like".tr,
                      fontSize: 17,
                    ),
                  ).toSliver,
                  const VMarginWidget(
                    isSLiver: true,
                  ),
                  staysWidget().toSliver,
                  const VMarginWidget(
                    isSLiver: true,
                  ),
                ],
              ),
            ),
            bottomWidget(),
          ],
        ),
      );
    });
  }

  Widget detailsWidget() {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingWidget(
            text: widget.model.title!,
          ),
          if (widget.model.location!.isNotEmpty) ...[
            const VMarginWidget(
              factor: 0.1,
            ),
            Row(
              children: [
                Image(
                  image: const AssetImage(Assets.iconsLocationPin),
                  color: CColors.grey4,
                  width: 10,
                ),
                const HMarginWidget(
                  factor: 0.3,
                ),
                Text(
                  widget.model.location!,
                  style: AppTextStyle.cobblerSans(
                    color: CColors.grey4,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const VMarginWidget(
              factor: 0.3,
            ),
          ],
          if (widget.model.rating != 0) ...[
            Row(
              children: [
                RatingBarIndicator(
                  rating: rating,
                  unratedColor: CColors.yellow.withOpacity(
                    0.5,
                  ),
                  itemBuilder: (context, index) => Icon(
                    IconlyBold.star,
                    color: CColors.yellow,
                  ),
                  itemCount: 5,
                  itemSize: 12,
                ),
                const HMarginWidget(
                  factor: 0.5,
                ),
                Text(
                  rating.toStringAsFixed(1),
                  style: AppTextStyle.urbanist(
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: CColors.black,
                    ),
                  ),
                ),
              ],
            ),
            const VMarginWidget(
              factor: 0.2,
            ),
          ],
          if (widget.model.reviews!.isNotEmpty) ...[
            Text(
              "${widget.model.reviews!.length} ${"Reviews".tr}",
              style: AppTextStyle.cobblerSans(
                fontSize: 12,
                color: CColors.black,
              ),
            ),
            const VMarginWidget(
              factor: 0.5,
            ),
          ],
          Wrap(
            children: [
              for (var attribute in widget.model.attributes!) ...[
                Text(
                  attribute,
                  style: AppTextStyle.cobblerSans(
                    color: CColors.black,
                    fontSize: 14,
                  ),
                ),
                if (attribute != widget.model.attributes!.last)
                  Text(
                    "  •  ",
                    style: AppTextStyle.cobblerSans(
                      color: CColors.black,
                      fontSize: 14,
                    ),
                  ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget aboutWidget() {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.model.cancellationHeader!.isNotEmpty ||
              widget.model.cancellationDescription!.isNotEmpty ||
              widget.model.attributes!.isNotEmpty) ...[
            HeadingWidget(
              text: "About this accommodation".tr,
              fontSize: 17,
            ),
            const VMarginWidget(
              factor: 0.5,
            ),
          ],
          if (widget.model.cancellationHeader!.isNotEmpty ||
              widget.model.cancellationDescription!.isNotEmpty) ...[
            aboutItemWidget(
              widget.model.cancellationHeader!,
              widget.model.cancellationDescription!,
              Assets.iconsCalendarCheck,
              CColors.green,
            ),
          ],
          if (widget.model.locationHeading!.isNotEmpty ||
              widget.model.locationDescription!.isNotEmpty) ...[
            aboutItemWidget(
              widget.model.locationHeading!,
              widget.model.locationDescription!,
              IconlyLight.location,
              CColors.primary,
            ),
          ],
          if (widget.model.numPeople != 0) ...[
            aboutItemWidget(
              "${widget.model.numPeople!.toInt()} ${"Guests".tr}",
              //"2 ${"Guests".tr}.".tr,
              "",
              IconlyLight.user,
              CColors.primary,
            ),
          ],
        ],
      ),
    );
  }

  Widget aboutItemWidget(
      String heading, String description, dynamic data, Color iconColor) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
      leading: data is IconData
          ? Icon(
              data,
              color: iconColor,
            )
          : ImageIcon(
              AssetImage(data),
              color: iconColor,
            ),
      title: Text(
        heading,
        style: AppTextStyle.cobblerSans(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: CColors.black,
        ),
      ),
      subtitle: description.isEmpty
          ? null
          : Text(
              description,
              style: AppTextStyle.cobblerSans(
                fontSize: 12,
                color: CColors.grey4,
              ),
            ),
    );
  }

  bool isAboutDeal = false;

  Widget descriptionWidget() {
    final maxLine = isAboutDeal ? null : 1;
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.model.placeDescription!.isNotEmpty) ...[
            HeadingWidget(text: "Description".tr),
            const VMarginWidget(
              factor: 0.2,
            ),
            Text(
              widget.model.placeDescription!,
              style: AppTextStyle.cobblerSans(
                color: CColors.black,
                fontSize: 14,
              ),
            ),
            TextTileWidget(
              text: isAboutDeal ? "Read Less" : "Read More".tr,
              onPressed: () {
                setState(() {
                  isAboutDeal = !isAboutDeal;
                });
              },
            ),
            const DividerWidget(),
          ],
        ],
      ),
    );
  }

  Widget facilityWidget() {
    int length = 0;
    List<String> list = widget.model.facilities!;

    if (list.isNotEmpty) {
      if (list.length > 3 && showAll) {
        length = 3;
      } else {
        length = list.length;
      }
    }

    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (list.isNotEmpty) ...[
            HeadingWidget(
              text: "Facilities".tr,
              fontSize: 17,
            ),
            const VMarginWidget(
              factor: 0.5,
            ),
            for (int i = 0; i < length; i++)
              facilityItemWidget(list[i], FeatherIcons.wifi
                  // Assets.iconsCalendarCheck,
                  ),
            // for (var facility in widget.model.facilities!)
            //   facilityItemWidget(facility, FeatherIcons.wifi
            //       // Assets.iconsCalendarCheck,
            //       ),
            if (list.length > 3) ...[
              TextTileWidget(
                text: showAll ? "Show All".tr : "Show Less".tr,
                onPressed: () {
                  setState(() {
                    showAll = !showAll;
                  });
                },
              ),
              const DividerWidget(),
            ],
          ],
        ],
      ),
    );
  }

  Widget facilityItemWidget(
    String heading,
    dynamic data,
  ) {
    return ListTile(
      dense: true,
      visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
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
        heading,
        style: AppTextStyle.urbanist(
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: CColors.black,
          ),
        ),
      ),
    );
  }

  Widget checkInWidget() {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.model.checkIn!.isNotEmpty) ...[
            HeadingWidget(
              text: "Check in".tr,
              fontSize: 17,
            ),
            const VMarginWidget(
              factor: 0.5,
            ),
            Text(
              widget.model.checkIn!,
              style: AppTextStyle.cobblerSans(
                color: CColors.black,
                fontSize: 14,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget locationWidget() {
    CameraPosition position = CameraPosition(
      target: LatLng(widget.model.latitude!, widget.model.longitude!),
      zoom: 14.4746,
    );

    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.model.locationDescription!.isNotEmpty ||
              widget.model.latitude! != 0 ||
              widget.model.longitude! != 0) ...[
            HeadingWidget(
              text: " Location".tr,
              fontSize: 17,
            ),
            const VMarginWidget(
              factor: 0.3,
            ),
            Text(
              widget.model.locationDescription!,
              style: AppTextStyle.cobblerSans(
                color: CColors.black,
                fontSize: 14,
              ),
            ),
            const VMarginWidget(
              factor: 0.5,
            ),
          ],
          if (widget.model.latitude! != 0 || widget.model.longitude! != 0) ...[
            AspectRatio(
              aspectRatio: 1.167,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  12,
                ),
                child: Visibility(
                  visible: mapWidgetVal,
                  child: MapWidget(
                    latitude: widget.model.latitude!,
                    longitude: widget.model.longitude!,
                    position: position,
                  ),
                ),
              ),
            ),
            const VMarginWidget(
              factor: 0.5,
            ),
            const DividerWidget(),
          ],
          if (widget.model.address!.isNotEmpty) ...[
            ListTile(
              onTap: () async {
                final Uri url = Uri.parse(
                    "https://www.google.com/maps/@${widget.model.latitude},${widget.model.longitude},15z");
                if (!await launchUrl(url,
                    mode: LaunchMode.externalApplication)) {
                  throw Exception('Could not launch $url');
                }
              },
              dense: true,
              visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
              leading: IconButton(
                color: CColors.primary,
                onPressed: () {
                  FlutterClipboard.copy(widget.model.address!);
                  Functions.showToast(
                    "Address successfully copied!",
                  );
                },
                icon: const Icon(Icons.copy),
              ),
              title: Text(
                widget.model.address!,
                style: AppTextStyle.cobblerSans(
                  color: CColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: CColors.grey3,
                size: 15,
              ),
            ),
            const DividerWidget(),
          ],
        ],
      ),
    );
  }

  Widget reviewsOverviewWidget() {
    return Container(
      padding: padding,
      child: Column(
        children: [
          HeadingWidget(
            text: "Guest reviews".tr,
            fontSize: 17,
          ),
          const VMarginWidget(
            factor: 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RatingBarIndicator(
                rating: 4,
                unratedColor: CColors.yellow.withOpacity(
                  0.5,
                ),
                itemBuilder: (context, index) => Icon(
                  IconlyBold.star,
                  color: CColors.yellow,
                ),
                itemCount: 5,
                itemSize: 20,
              ),
              const HMarginWidget(
                factor: 0.5,
              ),
              Text(
                rating.toStringAsFixed(1),
                style: AppTextStyle.cobblerSans(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: CColors.black,
                ),
              ),
            ],
          ),
          const VMarginWidget(
            factor: 0.5,
          ),
          Text(
            "${widget.model.reviews!.length} ${"reviews from verified customers".tr}",
            style: AppTextStyle.urbanist(
              style: TextStyle(
                fontSize: 12,
                color: CColors.black,
              ),
            ),
          ),
          const VMarginWidget(),
          TextButton.icon(
            icon: const Icon(Icons.add),
            label: Text("Add Review".tr),
            onPressed: () {
              showDialog(context: context, builder: (_) => RatingDialog())
                  .then((value) {});
            },
          ),
        ],
      ),
    );
  }

  Widget reviewList() {
    return SliverPadding(
      padding: padding,
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (ctx, i) {
            return ReviewWidget(
              model: widget.model.reviews![i],
            );
          },
          childCount: widget.model.reviews!.length,
        ),
      ),
    );
  }

  Widget seeAllReviewsWidget() {
    if (widget.model.reviews!.length > 3) {
      return Padding(
        padding: padding,
        child: Column(
          children: [
            DividerWidget(),
            TextTileWidget(
              text: "See all reviews".tr,
              onPressed: () {
                context.push(
                    child: ReviewScreen(
                  list: widget.model.reviews!,
                ));
              },
            ),
            DividerWidget(),
          ],
        ),
      );
    } else {
      return SizedBox();
    }
  }

  Widget staysWidget() {
    var list = [Constants.stay, Constants.stay];
    return SizedBox(
      height: 200,
      child: ListView.separated(
        padding: padding,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, i) {
          return StayWidget(
            index: i,
            model: list[i],
          );
        },
        separatorBuilder: (ctx, i) {
          return const HMarginWidget();
        },
        itemCount: list.length,
      ).removeScrollEffect(),
    );
  }

  Widget bottomWidget() {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: CColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: context.bottomPadding),
        padding: EdgeInsets.symmetric(
          vertical: height * 0.01,
        ),
        child: Row(
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                    text: "From:".tr,
                    style: AppTextStyle.urbanist(
                      style: TextStyle(
                        color: CColors.grey4,
                        fontSize: 20,
                      ),
                    ),
                    children: [
                      TextSpan(
                        text: "${widget.model.price?.toInt()} \$",
                        style: AppTextStyle.cobblerSans(
                          color: CColors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: "/${"night".tr}",
                        style: AppTextStyle.cobblerSans(
                          color: CColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ]),
              ),
            ),
            SizedBox(
              width: 129,
              height: 39,
              child: PrimaryButton(
                text: "Book Now".tr,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) => StayBookingDialog(
                            model: widget.model,
                          ));
                  // makePayment();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
