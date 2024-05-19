import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_book/extras/constant.dart';
import 'package:travel_book/widgets/blogs_widget.dart';
import 'package:travel_book/widgets/h1.dart';
import 'package:travel_book/widgets/margin_widget.dart';
import 'package:travel_book/widgets/stays_widget.dart';
import '../../models/special_offer_model.dart';
import '../../models/stay_model.dart';
import '../../models/tour_model.dart';
import '../../models/travel_blog_model.dart';
import '../../widgets/home_special_offer_carousel_widget.dart';
import '../../widgets/tour_and_ticket_widget.dart';

class SearchResults extends StatefulWidget {
  final String searchText;

  final List<SpecialOfferModel> specialOffers;
  final List<TravelBlogModel> blogs;
  final List<StayModel> stays;
  final List<TourModel> tours;

  SearchResults(
      {super.key,
      required this.stays,
      required this.tours,
      required this.blogs,
      required this.specialOffers,
      required this.searchText});

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  late double width, height;
  late EdgeInsets padding;

  List<SpecialOfferModel> specialOffers = [];
  List<TravelBlogModel> blogs = [];
  List<StayModel> stays = [];
  List<TourModel> tours = [];
  String searchText = "";

  @override
  void initState() {
    super.initState();
    searchText = widget.searchText;

    specialOffers = [Constants.specialOffer,Constants.specialOffer];

    stays = [Constants.stay,Constants.stay];

    blogs = [Constants.travelBlog,Constants.travelBlog];

    tours = [Constants.tour,Constants.tour,Constants.tour];
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    padding = EdgeInsets.symmetric(
      horizontal: width * 0.05,
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: h1("Search Results".tr, padding, color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VMarginWidget(),
            h1("Tours & Tickets".tr, padding),
            const VMarginWidget(),
            tours.isNotEmpty
                ? TourAndTicketWidget(tours: tours, padding: padding)
                : noDataFound(),
            const VMarginWidget(
              factor: 1.5,
            ),
            h1("Stays".tr, padding),
            const VMarginWidget(),
            stays.isNotEmpty
                ? StaysWidget(stays: stays, padding: padding)
                : noDataFound(),
            const VMarginWidget(
              factor: 1.5,
            ),
            h1("Travel Blog".tr, padding),
            const VMarginWidget(),
            blogs.isNotEmpty
                ? BlogsWidget(blogs: blogs, padding: padding)
                : noDataFound(),
            const VMarginWidget(
              factor: 1.5,
            ),
            h1("Special Offers".tr, padding),
            const VMarginWidget(),
            specialOffers.isNotEmpty ? specialOfferWidget() : noDataFound(),
            const VMarginWidget(
              factor: 1.5,
            ),
          ],
        ),
      ),
    );
  }

  Widget specialOfferWidget() {
    return Container(
      padding: padding,
      child: HomeCarouselWidget(
        specialOffers: specialOffers,
      ),
    );
  }

  Center noDataFound() => Center(
        child: Text("No Data Found".tr),
      );
}
