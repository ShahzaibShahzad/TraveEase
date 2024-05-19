import 'package:flutter/material.dart';
import 'package:utility_extensions/utility_extensions.dart';


class VMarginWidget extends StatelessWidget {
  const VMarginWidget({this.factor = 1, this.isSLiver = false, Key? key}) : super(key: key);
  final double factor;
  final bool isSLiver;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.height;
    if(isSLiver){
      return mainWidget(size).toSliver;
    }else{
      return mainWidget(size);
    }
  }
  Widget mainWidget(double size){
    return SizedBox(
      height: size * 0.03 * factor,
    );
  }
}


class HMarginWidget extends StatelessWidget {
  const HMarginWidget({this.factor = 1, Key? key}) : super(key: key);

  final double factor;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return SizedBox(
      width: size * 0.03 * factor,
    );
  }
}
