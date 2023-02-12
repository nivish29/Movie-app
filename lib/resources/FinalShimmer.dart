import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../auth.dart';
import '../utils/Routes/Route_name.dart';
import 'app_color.dart';

class ShimmerScreen extends StatefulWidget {
  const ShimmerScreen({Key? key}) : super(key: key);

  @override
  State<ShimmerScreen> createState() => _ShimmerScreenState();
}

class _ShimmerScreenState extends State<ShimmerScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.backgroundColor,
      extendBody: true,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 45, left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.7),
                        highlightColor: Colors.white.withOpacity(0.6),
                        child: Container(
                          height: 23,
                          width: 130,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 115),
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey.withOpacity(0.7),
                            highlightColor: Colors.white.withOpacity(0.6),
                            child: Container(
                              height: 23,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey.withOpacity(0.7),
                            highlightColor: Colors.white.withOpacity(0.6),
                            child: Container(
                              height: 23,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          )),
                    ],
                  )),
              SizedBox(
                height: 14,
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.7),
                highlightColor: Colors.white.withOpacity(0.6),
                child: Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Stack(
                      children: [
                        Container(
                          height: screenHeight * 0.25,
                          width: screenWidth * 0.9,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 26,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, bottom: 24),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.7),
                  highlightColor: Colors.white.withOpacity(0.7),
                  child: Container(
                    height: 23,
                    width: 160,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.7),
                highlightColor: Colors.white.withOpacity(0.6),
                child: Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 19),
                              child: Container(
                                height: screenHeight * 0.23,
                                width: screenWidth * 0.4,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 19, right: 10),
                              child: Container(
                                height: screenHeight * 0.23,
                                width: screenWidth * 0.4,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 26,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, bottom: 24),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.7),
                  highlightColor: Colors.white.withOpacity(0.7),
                  child: Container(
                    height: 23,
                    width: 190,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.7),
                highlightColor: Colors.white.withOpacity(0.6),
                child: Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 19),
                              child: Container(
                                height: screenHeight * 0.23,
                                width: screenWidth * 0.4,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 19, right: 10),
                              child: Container(
                                height: screenHeight * 0.23,
                                width: screenWidth * 0.4,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Transform.scale(
          scale: 0.9,
          child: FloatingActionButton.extended(
              label: Text(
                'Camera',
                style: TextStyle(fontSize: 12),
              ),
              icon: Icon(Icons.search_rounded),
              backgroundColor: AppColor.flushbarColor,
              onPressed: () {
                Navigator.pushNamed(context, RouteName.mlSearchScreen);
              }),
        ),
      ),
    );
  }
}
