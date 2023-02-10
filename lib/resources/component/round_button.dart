import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_color.dart';
import 'custom_Outline.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    required this.strokeWidth,
    required this.strokeRadius,
    required this.text,
    required this.fontSize,
    required this.textColor,
    required this.fontWeight,
    required this.onPress,
  }) : super(key: key);

  final double strokeWidth;
  final double strokeRadius;
  final String text;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onPress,
      child: CustomOutline(
        strokeWidth: strokeWidth,
        radius: strokeRadius,
        width: screenWidth * 0.35,
        height: screenHeight * 0.06,
        padding: EdgeInsets.all(8),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColor.logoGradient1,
            AppColor.logoGradient2.withOpacity(0.3),
            AppColor.logoGradient3.withOpacity(0.3),
            AppColor.logoGradient4,
          ],
          stops: const [0.2, 0.4, 0.6, 1],
        ),
        child: Center(
          child: Container(
            child: Text(
              text,
              style: GoogleFonts.dmSans(
                fontSize: fontSize,
                color: textColor,
                decoration: TextDecoration.none,
                fontWeight: fontWeight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// CustomOutline(
//   strokeWidth: 2.5,
//   radius: screenWidth * 0.7,
//   width: screenWidth * 0.35,
//   height: screenWidth * 0.12,
//   padding: EdgeInsets.all(8),
//   gradient: LinearGradient(
//     begin: Alignment.topLeft,
//     end: Alignment.bottomRight,
//     colors: [
//       AppColor.logoGradient1,
//       AppColor.logoGradient2.withOpacity(0.3),
//       AppColor.logoGradient3.withOpacity(0.3),
//       AppColor.logoGradient4,
//     ],
//     stops: const [0.2, 0.4, 0.6, 1],
//   ),
//   child: Center(
//     child: Container(
//       child: Text(
//         'Sign Up',
//         style: GoogleFonts.dmSans(
//           fontSize: 14,
//           color: AppColor.primaryTextColor,
//           decoration: TextDecoration.none,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     ),
//   ),
// ),
