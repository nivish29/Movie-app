import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_color.dart';

class BlurredBg extends StatelessWidget {
  const BlurredBg(
      {Key? key,
      required this.height,
      required this.width,
      required this.blurColor,
      required this.sigmaX,
      required this.sigmaY})
      : super(key: key);

  final double height;
  final double width;
  final Color blurColor;
  final double sigmaX;
  final double sigmaY;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: blurColor,
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
        child: Container(
          height: height,
          width: width,
          color: Colors.transparent,
        ),
      ),
    );
  }
}
// child: Container(
//   height: 166,
//   width: 166,
//   decoration: const BoxDecoration(
//     shape: BoxShape.circle,
//     color: AppColor.blurColor1,
//   ),
//   child: BackdropFilter(
//     filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
//     child: Container(
//       height: 166,
//       width: 166,
//       color: Colors.transparent,
//     ),
//   ),
// ),
