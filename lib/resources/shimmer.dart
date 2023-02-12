import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import 'app_color.dart';

class HorizontalCardShimmer extends StatefulWidget {
  const HorizontalCardShimmer({Key? key}) : super(key: key);

  @override
  State<HorizontalCardShimmer> createState() => _HorizontalCardShimmerState();
}

class _HorizontalCardShimmerState extends State<HorizontalCardShimmer> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.7),
      highlightColor: Colors.white.withOpacity(0.7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        height: screenHeight * 0.25,
                        width: screenWidth * 1,
                        child: Image.asset('assets/img_1.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 14,
          ),
        ],
      ),
    );
  }
}
