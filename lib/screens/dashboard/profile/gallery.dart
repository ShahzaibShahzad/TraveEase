import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_book/providers/data_provider.dart';
import 'package:utility_extensions/utility_extensions.dart';
import '../../../models/user_model.dart';
import 'image.dart';
class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  late double width, height;
  late String image;
  @override

  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text("My Gallery"),
      ),
    body: Consumer<DataProvider>(
      builder: (context,value,child) {
        UserModel model = value.userModel!;
        return GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: width * 0.02,vertical: height * 0.01),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: ( context,  index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: GestureDetector(
              onTap: (){
                context.push(child:  ImageGallery(image: model.images[index]));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(11),
                child: Hero(
                  tag: model.images[index],
                  child: Image.network(model.images[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
          },
          itemCount: model.images.length,
        );
      }
    ),
    );
  }
}
