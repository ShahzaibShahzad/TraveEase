import 'package:flutter/material.dart';
class ImageGallery extends StatefulWidget {
 ImageGallery({required this.image, Key? key}) : super(key: key);
 String image;


  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Hero(
            tag: widget.image,
            child: Image(image: NetworkImage(
              widget.image
            ),
            ),
          ),
        ),
      ),
    );
  }
}
