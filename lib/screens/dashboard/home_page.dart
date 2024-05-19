import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:travel_book/extras/colors.dart';
import 'package:travel_book/extras/constant.dart';
import 'package:travel_book/models/user_model.dart';
import 'package:travel_book/providers/data_provider.dart';
import 'package:travel_book/screens/dashboard/search_results.dart';
import 'package:travel_book/widgets/carousel_widget.dart';
import 'package:travel_book/widgets/h1.dart';
import 'package:travel_book/widgets/margin_widget.dart';
import 'package:travel_book/widgets/stays_widget.dart';
import 'package:travel_book/widgets/tour_and_ticket_widget.dart';
import 'package:utility_extensions/utility_extensions.dart';
import '../../extras/app_textstyle.dart';
import '../../generated/assets.dart';
import '../../widgets/home_special_offer_carousel_widget.dart';
import '../../widgets/news_widget.dart';
import '../../widgets/travel_blog_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double width, height;
  late EdgeInsets padding;

  late DataProvider provider;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    padding = EdgeInsets.symmetric(
      horizontal: width * 0.05,
    );
    return Consumer<DataProvider>(builder: (context, value, child) {
      provider = value;
      return Container(
        child: CustomScrollView(
          slivers: [
            const VMarginWidget(
              isSLiver: true,
            ),
            topWidget().toSliver,

              newsWidget().toSliver,
              const VMarginWidget().toSliver,

            headingWidget("Tours & Tickets".tr).toSliver,
            const VMarginWidget(
              factor: 0.5,
            ).toSliver,
            tourAndTicketWidget().toSliver,
            const VMarginWidget().toSliver,

            headingWidget("Stays".tr).toSliver,
            const VMarginWidget(
              factor: 0.5,
            ).toSliver,
            staysWidget().toSliver,
            const VMarginWidget().toSliver,
            headingWidget("Travel Blog".tr).toSliver,
            const VMarginWidget(
              factor: 0.5,
            ).toSliver,
            travelBlogWidget().toSliver,
            const VMarginWidget().toSliver,
             headingWidget("Special Offers".tr).toSliver,
              const VMarginWidget(
                factor: 0.5,
              ).toSliver,
              specialOfferWidget().toSliver,

            const VMarginWidget(
              isSLiver: true,
            ),
          ],
        ).removeScrollEffect(),
      );
    });
  }


  Text buildText(String str, {Color color = Colors.white}) {
    return Text(
      str,
      style: AppTextStyle.urbanist(
          style:  TextStyle(
        fontSize: 16,
        color: color,
        fontWeight: FontWeight.w500,
      )),
    );
  }

  Widget topWidget() {
    return Padding(
      padding: padding,
      child: Column(
        children: [
          headerWidget(),
          const VMarginWidget(),
          searchField(),
          const VMarginWidget(),
        ],
      ),
    );
  }

// Carousel slider
  Widget newsWidget() {
    var list = [Constants.news,Constants.news];
    return CarouselSlider.builder(
      itemCount: list.length,
      itemBuilder: (ctx, i, ri) {
        return Padding(
          padding: padding,
          child: NewsWidget(model: list[i]),
        );
      },
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.4,
        viewportFraction: 1,
      ),
    );
  }

/////
  Widget headerWidget() {
    UserModel? user = provider.userModel;
    if (user == null) {
      return const SizedBox();
    }
    return Row(
      children: [
        ClipOval(
          child: Image(
            image: user.images.isEmpty
                ? const AssetImage("assets/images/placeholder.jpeg")
                : NetworkImage(user.images.last) as ImageProvider,
            width: width * 0.08,
            height: width * 0.08,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: width * 0.03,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${"Hi".tr}, ${provider.userModel?.firstName} ${provider.userModel?.lastName}",
                style: AppTextStyle.cobblerSans(
                    fontSize: 12,
                    color: CColors.grey4,
                  ),
              ),
              Text(
                "Welcome".tr,
                style: AppTextStyle.cobblerSans(
                    fontSize: 21,
                    color: CColors.black,
                    fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  var searchController = TextEditingController();

  Widget searchField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          12,
        ),
        color: CColors.grey2,
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: width * 0.03,
            ),
            child: Icon(
              IconlyLight.search,
              color: CColors.grey4,
            ),
          ),
          Expanded(
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search place, tour, etc.".tr,
                hintStyle: AppTextStyle.cobblerSans(
                    color: CColors.grey4,
                    fontSize: 14,
                ),
              ),
              onSubmitted: (val) {
                if (searchController.text.isNotEmpty) {
                  context.push(
                    child: SearchResults(
                      searchText: searchController.text,
                      tours: provider.tours,
                      stays: provider.stays,
                      blogs: provider.blogs,
                      specialOffers: provider.specialOffers,
                    ),
                  );
                  searchController.text = "";
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget headingWidget(String text) {
    return h1(text, padding);
  }

  Widget tourAndTicketWidget() {
    return TourAndTicketWidget(tours: [Constants.tour,Constants.tour], padding: padding);
  }

  Widget staysWidget() {
    return StaysWidget(padding: padding, stays: [Constants.stay,Constants.stay]);
  }

  Widget travelBlogWidget() {
    var list = [Constants.travelBlog,Constants.travelBlog];
    return SizedBox(
      height: 220,
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

  Widget specialOfferWidget() {
    return Container(
      padding: padding,
      child: HomeCarouselWidget(
        specialOffers: [Constants.specialOffer,Constants.specialOffer],
      ),
    );
  }
}
