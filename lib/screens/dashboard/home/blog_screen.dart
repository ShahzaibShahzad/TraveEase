import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:travel_book/extras/constant.dart';
import 'package:travel_book/models/travel_details.dart';
import 'package:travel_book/providers/data_provider.dart';
import 'package:travel_book/widgets/divider_widget.dart';
import 'package:travel_book/widgets/faq_widget.dart';
import 'package:utility_extensions/utility_extensions.dart';
import '../../../extras/app_textstyle.dart';
import '../../../extras/colors.dart';
import '../../../generated/assets.dart';
import '../../../models/faq_model.dart';
import '../../../models/travel_blog_model.dart';
import '../../../widgets/details_top_widget.dart';
import '../../../widgets/heading_widget.dart';
import '../../../widgets/map_widget.dart';
import '../../../widgets/margin_widget.dart';
import '../../../widgets/text_tile_widget.dart';
import '../../../widgets/travel_blog_widget.dart';

class BlogScreen extends StatefulWidget {
  BlogScreen({required this.model, Key? key}) : super(key: key);
  TravelBlogModel model;

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
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
      return WillPopScope(
        onWillPop: () async {
          setState(() {
            mapWidgetVal = false;
          });
          return true;
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailsTopWidget(
                  ratingShow: false,
                  rating: widget.model.rating!,
                  images: widget.model.images!,
                  isCheck: true,
                  onTap: () {
                  },
                  onpress: () {

                  },
                ),
                const VMarginWidget(),
                detailsWidget(),
                const VMarginWidget(),

                for (var travelDetailModel in widget.model.travelDetails!) ...[
                  blogItemWidget(travelDetailModel),
                  const VMarginWidget(
                    factor: 1.5,
                  ),
                ],
                mapWidget(),
                const VMarginWidget(),
                Padding(
                  padding: padding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingWidget(
                        text: "FAQs".tr,
                        fontSize: 17,
                      ),
                      const DividerWidget(),
                    ],
                  ),
                ),
                for (var faqModel in widget.model.faq!) ...[
                  faqWidget(faqModel),
                ],
                const VMarginWidget(),
                infoWidget(),
                // const VMarginWidget(
                //   factor: 0.5,
                // ),

                  Padding(
                    padding: padding,
                    child: HeadingWidget(
                      text: "You might also like".tr,
                      fontSize: 17,
                    ),
                  ),
                  const VMarginWidget(
                    isSLiver: false,
                  ),
                  travelBlogWidget(),

                const VMarginWidget(),
              ],
            ),
          ).removeScrollEffect(),
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
          const VMarginWidget(
            factor: 0.3,
          ),
          if (widget.model.subTitle!.isNotEmpty) ...[
            Text(
              widget.model.subTitle!,
              style: AppTextStyle.cobblerSans(
                fontSize: 14,
                color: CColors.grey4,
              ),
            ),
            const VMarginWidget(
              factor: 0.3,
            ),
          ],
          if (widget.model.date!.isNotEmpty) ...[
            Text(
              widget.model.date!,
              style: AppTextStyle.cobblerSans(
                fontSize: 14,
                color: CColors.grey4,
              ),
            ),
            const VMarginWidget(),
          ],
          if (widget.model.description!.isNotEmpty) ...[
            Html(data: widget.model.description, style: {
              '#': Style(whiteSpace: WhiteSpace.normal),
              "img": Style(width: Width.auto(), height: Height.auto()),
            }),
          ],
        ],
      ),
    );
  }

  Widget blogItemWidget(TravelDetailsModel travelDetailsModel) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingWidget(
            text: travelDetailsModel.title!,
            fontSize: 17,
          ),
          const VMarginWidget(
            factor: 0.3,
          ),
          if (travelDetailsModel.link!.isNotEmpty) ...[
            InkWell(
              onTap: () {},
              child: Text(
                travelDetailsModel.link!,
                style: TextStyle(
                  color: CColors.primary,
                  fontSize: 14,
                ),
              ),
            ),
            const VMarginWidget(
              factor: 0.4,
            ),
          ],
          if (travelDetailsModel.timming!.isNotEmpty) ...[
            Text(
              travelDetailsModel.timming!,
              style: AppTextStyle.cobblerSans(
                color: CColors.grey4,
                fontSize: 14,
              ),
            ),
            const VMarginWidget(
              factor: 0.3,
            ),
          ],
          if (travelDetailsModel.location!.isNotEmpty) ...[
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
                  travelDetailsModel.location!,
                  style: AppTextStyle.cobblerSans(
                    color: CColors.grey4,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const VMarginWidget(),
          ],
          if (travelDetailsModel.description1!.isNotEmpty) ...[
            Text(
              travelDetailsModel.description1!,
              style: AppTextStyle.urbanist(
                style: TextStyle(
                  color: CColors.black,
                  fontSize: 14,
                ),
              ),
            ),
            const VMarginWidget(
              factor: 0.3,
            ),
          ],
          if (travelDetailsModel.image!.isNotEmpty) ...[
            AspectRatio(
              aspectRatio: 1.46,
              child: Image(
                image: NetworkImage(travelDetailsModel.image!
                    //travelDetailsModel.image
                    ),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const VMarginWidget(
              factor: 0.3,
            ),
          ],
          if (travelDetailsModel.imageDescription!.isNotEmpty) ...[
            Text(
              travelDetailsModel.imageDescription!,
              style: AppTextStyle.cobblerSans(
                fontSize: 10,
                color: CColors.grey4,
              ),
            ),
            const VMarginWidget(),
          ],
          if (travelDetailsModel.description2!.isNotEmpty) ...[
            Text(
              travelDetailsModel.description2!,
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

  Widget mapWidget() {
    CameraPosition position = CameraPosition(
      target: LatLng(widget.model.latitude!, widget.model.longitude!),
      zoom: 14.4746,
    );

    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.model.latitude! != 0 || widget.model.longitude! != 0) ...[
            HeadingWidget(
              text: "${"Map of".tr} Irish Pub",
              fontSize: 17,
            ),
            const VMarginWidget(),
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
        ],
      ),
    );
  }

  Widget faqWidget(FAQModel faqModel) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (faqModel.question.isNotEmpty || faqModel.answer.isNotEmpty) ...[
            FaqWidget(faqModel: faqModel),
            const DividerWidget(),
          ],
        ],
      ),
    );
  }

  Widget infoWidget() {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingWidget(
            text: "Discover Rome’s Best Bars on our Tipsy Tour,".tr,
            fontSize: 17,
          ),
          const VMarginWidget(
            factor: 0.5,
          ),
          Text(
            "Visiting Rome for the first time? Join us on our famous Tipsy Tour of Rome!"
                .tr,
            style: AppTextStyle.cobblerSans(
              color: CColors.black,
              fontSize: 14,
            ),
          ),
          const VMarginWidget(
            factor: 0.5,
          ),
          if (widget.model.link!.isNotEmpty) ...[
            InkWell(
              child: Text(
                widget.model.link!,
                style: AppTextStyle.cobblerSans(
                  color: CColors.primary,
                  fontSize: 14,
                ),
              ),
            ),
            const VMarginWidget(
              factor: 0.5,
            ),
          ],
          if (widget.model.image!.isNotEmpty) ...[
            AspectRatio(
              aspectRatio: 1.46,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image(
                      image: NetworkImage(widget.model.image!),
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(),
                  ),
                ],
              ),
            ),
            const VMarginWidget(),
          ],
          const DividerWidget(),
          TextTileWidget(text: "Comments".tr),
          const DividerWidget(),
          const VMarginWidget(
            factor: 0.5,
          ),
        ],
      ),
    );
  }

  Widget travelBlogWidget() {
    var list = [Constants.travelBlog];

    return SizedBox(
      height: 200,
      child: ListView.separated(
        padding: padding,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, i) {
          return TravelBlogWidget(
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

  @override
  void dispose() {
    super.dispose();
  }
}
