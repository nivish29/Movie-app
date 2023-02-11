import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/resources/component/custom_Outline.dart';
import '../resources/app_color.dart';

class ActorInfoScreen extends StatefulWidget {
  const ActorInfoScreen({
    Key? key,
    required this.profile_path,
    required this.name,
    required this.title1,
    required this.overview1,
    required this.title2,
    required this.overview2,
    required this.title3,
    required this.overview3,
  }) : super(key: key);

  final String profile_path;
  final String name;
  final String title1;
  final String overview1;
  final String title2;
  final String overview2;
  final String title3;
  final String overview3;

  @override
  State<ActorInfoScreen> createState() => _ActorInfoScreenState();
}

class _ActorInfoScreenState extends State<ActorInfoScreen> {
  @override
  Widget build(BuildContext context) {
    // final arguments =
    //     ModalRoute.of(context)?.settings?.arguments as Map<String, int>;
    //
    // final args = arguments['n'];

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                // alignment: Alignment.bottomCenter,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 65),
                      child: CustomOutline(
                        strokeWidth: 4,
                        radius: screenWidth * 0.7,
                        width: screenWidth * 0.7,
                        height: screenWidth * 0.7,
                        padding: EdgeInsets.all(8),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppColor.logoGradient1,
                            AppColor.logoGradient2.withOpacity(0),
                            AppColor.logoGradient3.withOpacity(0.1),
                            AppColor.logoGradient4,
                          ],
                          stops: const [0.2, 0.4, 0.6, 1],
                        ),
                        child: Container(
                            // margin: EdgeInsets.only(top: 35),
                            height: screenHeight * 0.4,
                            width: screenWidth * 0.7,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    "https://image.tmdb.org/t/p/original${widget.profile_path}",
                                  ),
                                ))),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: screenWidth * 0.8,
                child: Text(
                  (widget.name),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dmSans(
                    fontSize: 20,
                    color: AppColor.primaryTextColor,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  '- - - -  Popular Movies  - - - -',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dmSans(
                    fontSize: 15,
                    color: AppColor.secondaryTextColor,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                '${widget.title1}',
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSans(
                  fontSize: 20,
                  color: AppColor.primaryTextColor,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: screenWidth * 0.9,
                child: Text(
                  '${widget.overview1}',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dmSans(
                    fontSize: 15,
                    color: AppColor.secondaryTextColor,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '${widget.title2}',
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSans(
                  fontSize: 20,
                  color: AppColor.primaryTextColor,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: screenWidth * 0.9,
                child: Text(
                  '${widget.overview2}',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dmSans(
                    fontSize: 15,
                    color: AppColor.secondaryTextColor,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '${widget.title3}',
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSans(
                  fontSize: 20,
                  color: AppColor.primaryTextColor,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: screenWidth * 0.9,
                child: Text(
                  '${widget.overview3}',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dmSans(
                    fontSize: 15,
                    color: AppColor.secondaryTextColor,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
