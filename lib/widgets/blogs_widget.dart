import 'package:flutter/material.dart';
import 'package:travel_book/widgets/travel_blog_widget.dart';
import 'package:utility_extensions/utility_extensions.dart';

import '../models/travel_blog_model.dart';
import 'margin_widget.dart';

class BlogsWidget extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final List<TravelBlogModel> blogs;

  const BlogsWidget({super.key, required this.padding, required this.blogs});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        padding: padding,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, i) {
          return TravelBlogWidget(
            index: i,
            model: blogs[i],
          );
        },
        separatorBuilder: (ctx, i) {
          return const HMarginWidget();
        },
        itemCount: blogs.length,
      ).removeScrollEffect(),
    );
  }
}
