import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:travel_book/providers/data_provider.dart';
import 'package:utility_extensions/utility_extensions.dart';
import '../extras/app_textstyle.dart';
import '../extras/colors.dart';
import '../generated/assets.dart';
import '../models/special_offer_model.dart';
import '../screens/dashboard/home/offers_screen.dart';

class SpecialOfferWidget extends StatelessWidget {
  SpecialOfferWidget({required this.model, Key? key}) : super(key: key);

  SpecialOfferModel model;
  late double width, height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Consumer<DataProvider>(builder: (context, value, child) {
      return InkWell(
        onTap: () {
          context.push(child: OffersScreen(model: model));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            12,
          ),
          child: Stack(children: [
            if (model.images!.isNotEmpty) ...[
              Image(
                image: NetworkImage(
                  model.images!.first,
                ),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ] else ...[
              if (model.images!.isEmpty) ...[
                const Image(
                  image: AssetImage(Assets.placeholder1),
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                )
              ],
              ],
              Positioned.fill(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.015,
                    vertical: height * 0.01,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black,
                      ],
                      stops: [
                        0.75,
                        1.0,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: FloatingActionButton(
                            heroTag: model.id,
                            onPressed: () {
                            },
                            backgroundColor: CColors.white,
                            child: Icon(IconlyLight.bookmark,
                              color: CColors.grey3,
                              size: 10,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 70),
                          child: Text(
                            model.title!,
                            maxLines: 1,
                            style: AppTextStyle.cobblerSans(
                                color: CColors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 21,
                              ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ]),
        ),
      );
    });
  }
}
