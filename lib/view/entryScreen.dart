import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/resources/app_color.dart';
import 'package:movie_app/resources/component/blurred_bg.dart';
import 'package:movie_app/resources/component/custom_Outline.dart';
import 'package:movie_app/resources/component/round_button.dart';

import '../utils/Routes/Route_name.dart';
import '../utils/utils.dart';
import 'entryScreenService.dart';
import 'homeScreen.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({Key? key}) : super(key: key);

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  entryScreenServices splashScreen = entryScreenServices();
  void initState() {
    // TODO: implement initState
    splashScreen.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.backgroundColor,
      extendBody: true,
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: [
            Positioned(
              top: screenHeight * 0.15,
              left: -100,
              child: BlurredBg(
                  height: 166,
                  width: 166,
                  blurColor: AppColor.blurColor1,
                  sigmaX: 50,
                  sigmaY: 50),
            ),
            Positioned(
              right: -120,
              top: screenHeight * 0.25,
              child: BlurredBg(
                  height: 180,
                  width: 180,
                  blurColor: AppColor.blurColor2,
                  sigmaX: 50,
                  sigmaY: 50),
            ),
            Positioned(
              bottom: screenHeight * 0.1,
              left: -50,
              child: BlurredBg(
                  height: 200,
                  width: 300,
                  blurColor: AppColor.blurColor3,
                  sigmaX: 120,
                  sigmaY: 120),
            ),
            SafeArea(
                child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenHeight * 0.15,
                  ),
                  CustomOutline(
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
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/profile_logo.png'),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.07,
                  ),
                  Text(
                    'A Single stop for all your movie Requirements',
                    // style: TextStyle(
                    //   fontSize: 28,
                    //   color: AppColor.PrimaryTextColor,
                    // ),
                    style: GoogleFonts.dmSans(
                      fontSize: 27,
                      color: AppColor.primaryTextColor,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: screenHeight * 0.04,
                  ),
                  Text(
                    'Do surf for your kinda movie',
                    // style: TextStyle(
                    //   fontSize: 28,
                    //   color: AppColor.PrimaryTextColor,
                    // ),
                    style: GoogleFonts.saira(
                      fontSize: 14,
                      color: AppColor.secondaryTextColor,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: screenHeight * 0.04,
                  ),
                  SizedBox(
                    height: screenHeight * 0.2,
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
