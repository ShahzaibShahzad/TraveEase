import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:travel_book/extras/constant.dart';
import 'package:travel_book/providers/data_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:utility_extensions/utility_extensions.dart';
import '../../../extras/app_textstyle.dart';
import '../../../extras/colors.dart';
import '../../../extras/functions.dart';
import '../../../generated/assets.dart';
import '../../../models/special_offer_model.dart';
import '../../../widgets/details_top_widget.dart';
import '../../../widgets/divider_widget.dart';
import '../../../widgets/heading_widget.dart';
import '../../../widgets/map_widget.dart';
import '../../../widgets/margin_widget.dart';
import '../../../widgets/offers_bottom_widget.dart';
import '../../../widgets/primary_button_widget.dart';
import '../../../widgets/text_tile_widget.dart';
import '../../../widgets/tour_booking_details.dart';

class OffersScreen extends StatefulWidget {
  OffersScreen({required this.model, Key? key}) : super(key: key);
  SpecialOfferModel model;

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  late double width, height;
  late EdgeInsets padding;
  late DataProvider provider;

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
      return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailsTopWidget(
                      images: widget.model.images!,
                      rating: widget.model.rating!,
                      isCheck: true,
                      onTap: () {
                      },
                      onpress: () {

                      },
                    ),
                    const VMarginWidget(),
                    detailsWidget(),
                    const VMarginWidget(),
                    aboutDealWidget(),
                    const VMarginWidget(
                      factor: 0.5,
                    ),
                    aboutClubWidget(),
                    const VMarginWidget(
                      factor: 0.5,
                    ),
                    locationWidget(),
                    const VMarginWidget(),
                      Padding(
                        padding: padding,
                        child: HeadingWidget(
                          text: "You might also like".tr,
                          fontSize: 17,
                        ),
                      ),
                      const VMarginWidget(),
                      offersBottomWidget(),
                      const VMarginWidget(),
                  ],
                ),
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
              factor: 0.6,
            ),
          ],
          if (widget.model.link!.isNotEmpty) ...[
            InkWell(
              onTap: () {},
              child: Text(
                widget.model.link!,
                style: AppTextStyle.cobblerSans(
                  color: CColors.primary,
                  fontSize: 14,
                ),
              ),
            ),
            const VMarginWidget(
              factor: 0.6,
            ),
          ],
          if (widget.model.time!.isNotEmpty) ...[
            Text(
              widget.model.time!,
              style: AppTextStyle.cobblerSans(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: CColors.black,
              ),
            ),
          ],
        ],
      ),
    );
  }

  bool isAboutDeal = false;

  Widget aboutDealWidget() {
    final maxLine = isAboutDeal ? null : 1;
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.model.dealDescription!.isNotEmpty) ...[
            Text(
              "About this deal".tr,
              style: AppTextStyle.cobblerSans(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
              ),
            ),
            const VMarginWidget(
              factor: 0.2,
            ),
            Text(
              widget.model.dealDescription!,
              maxLines: maxLine,
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

  bool isAboutPlace = false;

  Widget aboutClubWidget() {
    final maxLine = isAboutPlace ? null : 1;
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.model.placeDescription!.isNotEmpty) ...[
            Text(
              "${"About the".tr} Ice Club",
              style: AppTextStyle.cobblerSans(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
              ),
            ),
            const VMarginWidget(
              factor: 0.2,
            ),
            Text(
              widget.model.placeDescription!,
              maxLines: maxLine,
              style: AppTextStyle.cobblerSans(
                  color: CColors.black,
                  fontSize: 14,
              ),
            ),
            TextTileWidget(
              text: isAboutPlace ? "Read Less" : "Read More".tr,
              onPressed: () {
                setState(() {
                  isAboutPlace = !isAboutPlace;
                });
              },
            ),
            const DividerWidget(),
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
          if (widget.model.locationDescription!.isNotEmpty) ...[
            HeadingWidget(
              text: "Location".tr,
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


  Widget offersBottomWidget() {
    var list = [Constants.specialOffer,Constants.specialOffer];
    print(list.length);
    return SizedBox(
      height: 200,
      child: ListView.separated(
        padding: padding,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, i) {
          return OffersBottomWidget(
            index: i,
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
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.01,
        ),
        child: SizedBox(
          height: 39,
          child: PrimaryButton(
            text: "Reserve".tr,
            onPressed: () {
              context.push(
                child: TourBookingDialog(
                  specialOffer: widget.model,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
