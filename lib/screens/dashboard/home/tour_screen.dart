import 'package:clipboard/clipboard.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:travel_book/extras/app_textstyle.dart';
import 'package:travel_book/extras/constant.dart';
import 'package:travel_book/providers/data_provider.dart';
import 'package:travel_book/widgets/divider_widget.dart';
import 'package:travel_book/widgets/heading_widget.dart';
import 'package:travel_book/widgets/margin_widget.dart';
import 'package:travel_book/widgets/primary_button_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:utility_extensions/utility_extensions.dart';
import '../../../extras/colors.dart';
import '../../../extras/functions.dart';
import '../../../generated/assets.dart';
import '../../../models/tour_model.dart';
import '../../../widgets/details_top_widget.dart';
import '../../../widgets/dialog_widget.dart';
import '../../../widgets/map_widget.dart';
import '../../../widgets/more_text_widget.dart';
import '../../../widgets/tour_booking_details.dart';
import '../../../widgets/review_widget.dart';
import '../../../widgets/text_tile_widget.dart';
import '../../../widgets/tour_ticket_widget.dart';
import '../../review/review_screen.dart';

class TourScreen extends StatefulWidget {
  TourScreen({required this.model, Key? key}) : super(key: key);
  TourModel model;

  @override
  State<TourScreen> createState() => _TourScreenState();
}

class _TourScreenState extends State<TourScreen> {
  late double width, height;
  late EdgeInsets padding;
  double rating = 0.0;
  late DataProvider provider;

  int? selectedItem;

  bool mapWidgetVal = true;

  @override
  void initState() {
    super.initState();
  }

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
        backgroundColor: CColors.white,
        body: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  DetailsTopWidget(
                    rating: widget.model.rating!,
                    images: widget.model.images!,
                    isCheck: true,
                    onTap: () {
                    },
                    onpress: () {

                    },
                  ).toSliver,
                  const VMarginWidget(
                    isSLiver: true,
                  ),
                  detailsWidget().toSliver,
                  const VMarginWidget(
                    isSLiver: true,
                  ),
                  aboutWidget().toSliver,
                  const VMarginWidget(
                    isSLiver: true,
                  ),
                  originalExperienceWidget().toSliver,
                  const VMarginWidget(
                    isSLiver: true,
                  ),
                  prepareWidget().toSliver,
                  const VMarginWidget(
                    isSLiver: true,
                  ),
                  meetingPointWidget().toSliver,
                  const VMarginWidget(
                    isSLiver: true,
                  ),
                  reviewsOverviewWidget().toSliver,
                  // const VMarginWidget(
                  //   isSLiver: true,
                  //   factor: 0.3,
                  // ),
                  reviewList(),
                  // const VMarginWidget(
                  //   isSLiver: true,
                  // ),
                  seeAllReviewsWidget().toSliver,
                  // const VMarginWidget(
                  //   isSLiver: true,
                  // ),
                    Padding(
                      padding: padding,
                      child: HeadingWidget(
                        text: "You might also like",
                        fontSize: 17,
                      ),
                    ).toSliver,
                    const VMarginWidget(
                      isSLiver: true,
                    ),
                    tourAndTicketWidget().toSliver,
                  const VMarginWidget(
                    isSLiver: true,
                  ),
                ],
              ).removeScrollEffect(),
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

          if (getRating() != 0) ...[
            const VMarginWidget(
              factor: 0.3,
            ),
            Row(
              children: [
                RatingBarIndicator(
                  rating: getRating(),
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
                  getRating().toStringAsFixed(1),
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
            Text(
              "${widget.model.reviews!.length} ${"Reviews".tr}",
              style: AppTextStyle.cobblerSans(
                  fontSize: 12,
                  color: CColors.black,
              ),
            ),
          ],
        ],
      ),
    );
  }

  double getRating() {
    if (widget.model.reviews != null) {
      if (widget.model.reviews!.isEmpty) {
        return 0;
      } else {
        double sum = 0;
        for (var element in widget.model.reviews!) {
          sum += element.rating;
        }

        return sum / (widget.model.reviews!.length * 5);
      }
    } else {
      return 0;
    }
  }

  Widget aboutWidget() {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.model.cancellationDescription!.isNotEmpty ||
              widget.model.durationHeader!.isNotEmpty ||
              widget.model.numPeople! != 0) ...[
            HeadingWidget(
              text: "About this activity".tr,
              fontSize: 17,
            ),
            const VMarginWidget(
              factor: 0.5,
            ),
          ],
          if (widget.model.cancellationDescription!.isNotEmpty ||
              widget.model.cancellationHeader!.isNotEmpty) ...[
            aboutItemWidget(
              widget.model.cancellationHeader!,
              widget.model.cancellationDescription!,
              Assets.iconsCalendarCheck,
              CColors.green,
            ),
          ],
          if (widget.model.durationHeader!.isNotEmpty ||
              widget.model.durationDescription!.isNotEmpty) ...[
            aboutItemWidget(
              widget.model.durationHeader!,
              widget.model.durationDescription!,
              FeatherIcons.clock,
              CColors.primary,
            ),
          ],
          if (widget.model.numPeople! != 0) ...[
            aboutItemWidget(
              "Group of ${widget.model.numPeople!.toInt()} people max.".tr,
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
      visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
      contentPadding: EdgeInsets.zero,
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

  bool showIncluded = false,
      showDescription = false,
      showHighlights = false,
      showKnowBefore = false;

  Widget originalExperienceWidget() {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.model.whatIncluded!.isNotEmpty) ...[
            HeadingWidget(
              text: "The Original Experience".tr,
              fontSize: 17,
            ),
            const VMarginWidget(
              factor: 0.7,
            ),
            const DividerWidget(),
            TextTileWidget(
              text: "What's included".tr,
              onPressed: () {
                setState(() {
                  showIncluded = !showIncluded;
                });
              },
              trailingIcon: showIncluded ? Icons.keyboard_arrow_down : null,
            ),
            if (showIncluded)
              for (var text in widget.model.whatIncluded!)
                MoreTextWidget(text: text),
            const DividerWidget(),
          ],
          if (widget.model.description != null &&
              widget.model.description!.isNotEmpty) ...[
            TextTileWidget(
              text: "Full description".tr,
              onPressed: () {
                setState(() {
                  showDescription = !showDescription;
                });
              },
              trailingIcon: showDescription ? Icons.keyboard_arrow_down : null,
            ),

            if (showDescription)
              Text(
                widget.model.description!,
                // maxLines: maxLine,
                style: AppTextStyle.urbanist(
                  style: TextStyle(
                    color: CColors.black,
                    fontSize: 14,
                  ),
                ),
              ),
            //   for (var text in widget.model.whatIncluded!)
            //     MoreTextWidget(text: text),
            const DividerWidget(),
          ],
          if (widget.model.highlights!.isNotEmpty) ...[
            TextTileWidget(
              text: "Highlights".tr,
              onPressed: () {
                setState(() {
                  showHighlights = !showHighlights;
                });
              },
              trailingIcon: showHighlights ? Icons.keyboard_arrow_down : null,
            ),
            if (showHighlights)
              for (var text in widget.model.highlights!)
                MoreTextWidget(text: text),
            const DividerWidget(),
          ],
        ],
      ),
    );
  }

  Widget prepareWidget() {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.model.knowBeforeGo!.isNotEmpty) ...[
            HeadingWidget(
              text: "Prepare for the activity".tr,
              fontSize: 17,
            ),
            const VMarginWidget(
              factor: 0.7,
            ),
            const DividerWidget(),
            TextTileWidget(
              text: "Know before you go",
              onPressed: () {
                setState(() {
                  showKnowBefore = !showKnowBefore;
                });
              },
              trailingIcon: showKnowBefore ? Icons.keyboard_arrow_down : null,
            ),
            if (showKnowBefore)
              for (var text in widget.model.knowBeforeGo!)
                MoreTextWidget(text: text),
            const DividerWidget(),
          ],
        ],
      ),
    );
  }

  Widget meetingPointWidget() {
    CameraPosition position = CameraPosition(
      target: LatLng(widget.model.latitude!, widget.model.longitude!),
      zoom: 14.4746,
    );

    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.model.placeDescription!.isNotEmpty ||
              widget.model.longitude! != 0 ||
              widget.model.longitude! != 0) ...[
            HeadingWidget(
              text: "Meeting point".tr,
              fontSize: 17,
            ),
            const VMarginWidget(
              factor: 0.3,
            ),
            Text(
              widget.model.placeDescription!,
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
          ],
          if (widget.model.address!.isNotEmpty) ...[
            const DividerWidget(),
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

                  Functions.showToast("Address successfully copied!");
                },
                icon: const Icon(Icons.copy),
              ),
              title: Text(
                widget.model.address!,
                style: AppTextStyle.urbanist(
                  style: TextStyle(
                    color: CColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
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
          if (widget.model.reviews!.isNotEmpty) ...[
            HeadingWidget(
              text: "Customer reviews".tr,
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
                  style: AppTextStyle.urbanist(
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: CColors.black,
                    ),
                  ),
                ),
              ],
            ),
            const VMarginWidget(
              factor: 0.5,
            ),
            Text(
              "${widget.model.reviews!.length} ${"reviews from verified customers".tr}",
              style: AppTextStyle.cobblerSans(
                  fontSize: 12,
                  color: CColors.black,
              ),
            ),
            const VMarginWidget(),
            TextButton.icon(
              icon: const Icon(Icons.add),
              label: Text("Add Review".tr),
              onPressed: () {
                showDialog(context: context, builder: (_) => RatingDialog())
                    .then((value) {

                });
              },
            ),
          ],
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
            ); //const ReviewWidget();
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
            const DividerWidget(),
            TextTileWidget(
              text: "See all reviews".tr,
              onPressed: () {
                context.push(
                    child: ReviewScreen(
                  list: widget.model.reviews!,
                ));
              },
            ),
            const DividerWidget(),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  Widget tourAndTicketWidget() {
    var list = [Constants.tour,Constants.tour];
    return SizedBox(
      height: 200,
      child: ListView.separated(
        padding: padding,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, i) {
          return TourTicketWidget(
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
                    style: AppTextStyle.cobblerSans(
                        color: CColors.grey4,
                        fontSize: 20,
                    ),
                    children: [
                      TextSpan(
                        // text: widget.model.price.toString(),
                        text: "${widget.model.price?.toInt()} \$",
                        style: AppTextStyle.cobblerSans(
                            color: CColors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                      ),
                      TextSpan(
                        text: "/${"person".tr}",
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
                  context.push(
                    child: TourBookingDialog(
                      tourModel: widget.model,
                    ),
                  );

                  // context.push(child: const OptionDetails());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
