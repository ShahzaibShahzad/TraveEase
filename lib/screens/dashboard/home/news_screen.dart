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
import '../../../models/news_model.dart';
import '../../../widgets/details_top_widget.dart';
import '../../../widgets/divider_widget.dart';
import '../../../widgets/heading_widget.dart';
import '../../../widgets/map_widget.dart';
import '../../../widgets/margin_widget.dart';
import '../../../widgets/news_bottom_widget.dart';
import '../../../widgets/text_tile_widget.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({required this.model, Key? key}) : super(key: key);
  NewsModel model;

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late double width, height;
  late EdgeInsets padding;
  late DataProvider provider;
  bool readMore = true;
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailsTopWidget(
                rating: widget.model.rating,
                images: widget.model.images,
                isCheck: true,
                onTap: () {
                },
                onpress: () {

                },
              ),
              const VMarginWidget(),
              detailsWidget(),
              const VMarginWidget(),
              descriptionWidget(),
              const VMarginWidget(),
              locationWidget(),
              const VMarginWidget(),
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
                newsBottomWidget().toSliver,
              ],
          ),
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
            text: widget.model.title,
          ),
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
                widget.model.location,
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
          InkWell(
            onTap: () async {
              await Functions.launchInBrowser(widget.model.link ?? "");
            },
            child: Text(
              widget.model.link,
              style: AppTextStyle.cobblerSans(
                color: CColors.primary,
                fontSize: 14,
              ),
            ),
          ),
          const VMarginWidget(
            factor: 0.6,
          ),
          Text(
            widget.model.time,
            style: AppTextStyle.cobblerSans(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: CColors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget descriptionWidget() {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "About this event".tr,
            style: AppTextStyle.cobblerSans(
                fontSize: 17,
                fontWeight: FontWeight.w600,
            ),
          ),
          const VMarginWidget(
            factor: 0.2,
          ),
          Text(
            readMore == false ? widget.model.newsDescription :
            widget.model.newsDescription.length > 200 ?
            "${widget.model.newsDescription.substring(0, 200)}......." :
            widget.model.newsDescription,
            // widget.model.newsDescription,
            style: AppTextStyle.cobblerSans(
                color: CColors.black,
                fontSize: 14,
            ),
          ),
          if(widget.model.newsDescription.length > 200)...[
            InkWell(
              onTap: (){
                setState(() {
                  readMore = !readMore;
                });
              },
              child: TextTileWidget(
                  text: readMore == true ? "Read More".tr : "Read Less"),
            ),
            const DividerWidget(),
          ],

        ],
      ),
    );
  }

  Widget locationWidget() {
    CameraPosition position = CameraPosition(
      target: LatLng(widget.model.latitude, widget.model.longitude),
      zoom: 14.4746,
    );

    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingWidget(
            text: "Location".tr,
            fontSize: 17,
          ),
          const VMarginWidget(
            factor: 0.3,
          ),
          Text(
            widget.model.locationDescription,
            style: AppTextStyle.cobblerSans(
                color: CColors.black,
                fontSize: 14,
            ),
          ),
          const VMarginWidget(
            factor: 0.5,
          ),
          AspectRatio(
            aspectRatio: 1.167,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                12,
              ),
              child: Visibility(
                visible: mapWidgetVal,
                child: MapWidget(
                  latitude: widget.model.latitude,
                  longitude: widget.model.longitude,
                  position: position,
                ),
              ),
            ),
          ),
          const VMarginWidget(
            factor: 0.5,
          ),
          const DividerWidget(),
          ListTile(
            dense: true,
            visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
            leading: IconButton(
              color: CColors.primary,
              onPressed: () {
                FlutterClipboard.copy(widget.model.address);
                Functions.showToast("Address successfully copied!");

              },
              icon: const Icon(Icons.copy),
            ),
            title: InkWell(
              onTap: () async {
                final Uri url = Uri.parse("https://www.google.com/maps/@${widget.model.latitude},${widget.model.longitude},15z");

                if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                throw Exception('Could not launch $url');
                }
              },
              child: Text(
                widget.model.address,
                style: AppTextStyle.cobblerSans(
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
      ),
    );
  }

  Widget newsBottomWidget() {
    var list = [Constants.news,Constants.news];
    return SizedBox(
      height: 200,
      child: ListView.separated(
        padding: padding,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, i) {
          return NewsBottomWidget(
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
}
