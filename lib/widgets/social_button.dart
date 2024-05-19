import 'package:flutter/material.dart';

import '../extras/colors.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    required this.onPressed,
    required this.image,

    Key? key,
  }) : super(key: key);
  final Function() onPressed;
  final String image;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Image(
        image: AssetImage(image),
        width: 42,
        height: 42,
      ),
    );
  }
}
