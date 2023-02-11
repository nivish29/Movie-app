import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resources/app_color.dart';

class SearchInfoScreen extends StatefulWidget {
  const SearchInfoScreen({
    Key? key,
    required this.ImageUrl,
    required this.title,
    required this.date,
    required this.language,
    required this.vote_average,
    required this.plot,
    required this.Genre,
    required this.Actors,
    required this.Country,
  }) : super(key: key);

  final String ImageUrl;
  final String title;
  final String date;
  final String language;
  final double vote_average;
  final String plot;
  final String Genre;
  final String Actors;
  final String Country;

  @override
  State<SearchInfoScreen> createState() => _SearchInfoScreenState();
}

class _SearchInfoScreenState extends State<SearchInfoScreen> {
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
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: screenHeight * 0.5,
                    width: screenWidth,
                    child: Image.network(
                      "${widget.ImageUrl}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.5,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Colors.black.withOpacity(0.15),
                          Color(0xFF090A0E)
                        ])),
                  ),
                  Positioned(
                      bottom: 20,
                      child: (widget.title.length > 20)
                          ? Container(
                              width: screenWidth * 0.8,
                              child: Text(
                                (widget.title),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.dmSans(
                                  fontSize: 20,
                                  color: AppColor.primaryTextColor,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          : Text(
                              (widget.title),
                              style: GoogleFonts.dmSans(
                                fontSize: 24,
                                color: AppColor.primaryTextColor,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Released On: ${widget.date}',
                      style: TextStyle(
                          color: AppColor.secondaryTextColor, fontSize: 15),
                    ),
                    Text(
                      '  |  ',
                      style: TextStyle(
                          color: AppColor.secondaryTextColor, fontSize: 15),
                    ),
                    Text(
                      'Language: ${widget.language}',
                      style: TextStyle(
                        color: AppColor.secondaryTextColor,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        'Country Origin: ${widget.Country}',
                        style: TextStyle(
                            color: AppColor.secondaryTextColor, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        'Genre: ${widget.Genre}',
                        style: TextStyle(
                            color: AppColor.secondaryTextColor, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 10),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.all(3.0),
              //         child: Text(
              //           'Rating: ${widget.vote_average}',
              //           style: TextStyle(
              //               color: AppColor.secondaryTextColor, fontSize: 15),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              //
              (widget.vote_average > 8)
                  ? Padding(
                      padding: const EdgeInsets.only(top: 17),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Icon(
                              Icons.star,
                              color: Color(0xFFF2A33A),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Icon(
                              Icons.star,
                              color: Color(0xFFF2A33A),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Icon(
                              Icons.star,
                              color: Color(0xFFF2A33A),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Icon(
                              Icons.star,
                              color: Color(0xFFF2A33A),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Icon(
                              Icons.star,
                              color: Color(0xFFF2A33A),
                            ),
                          ),
                        ],
                      ),
                    )
                  : (widget.vote_average > 7 && widget.vote_average < 8)
                      ?
                      //7<x<8
                      Padding(
                          padding: const EdgeInsets.only(top: 17),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Icon(
                                  Icons.star,
                                  color: Color(0xFFF2A33A),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Icon(
                                  Icons.star,
                                  color: Color(0xFFF2A33A),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Icon(
                                  Icons.star,
                                  color: Color(0xFFF2A33A),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Icon(
                                  Icons.star,
                                  color: Color(0xFFF2A33A),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Icon(
                                  Icons.star,
                                  color: AppColor.primaryTextColor,
                                ),
                              ),
                            ],
                          ),
                        )
                      :
                      //5<x<7
                      (widget.vote_average > 5 && widget.vote_average < 7)
                          ? Padding(
                              padding: const EdgeInsets.only(top: 17),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Icon(
                                      Icons.star,
                                      color: Color(0xFFF2A33A),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Icon(
                                      Icons.star,
                                      color: Color(0xFFF2A33A),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Icon(
                                      Icons.star,
                                      color: Color(0xFFF2A33A),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Icon(
                                      Icons.star,
                                      color: AppColor.primaryTextColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Icon(
                                      Icons.star,
                                      color: AppColor.primaryTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          :
                          //x<5
                          Padding(
                              padding: const EdgeInsets.only(top: 17),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Icon(
                                      Icons.star,
                                      color: Color(0xFFF2A33A),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Icon(
                                      Icons.star,
                                      color: Color(0xFFF2A33A),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Icon(
                                      Icons.star,
                                      color: AppColor.primaryTextColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Icon(
                                      Icons.star,
                                      color: AppColor.primaryTextColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Icon(
                                      Icons.star,
                                      color: AppColor.primaryTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Plot',
                  style: GoogleFonts.dmSans(
                    fontSize: 22,
                    color: AppColor.primaryTextColor,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 17),
                child: Container(
                  width: screenWidth * 0.9,
                  child: Text(
                    widget.plot,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSans(
                      fontSize: 14,
                      color: AppColor.secondaryTextColor,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 17),
                child: Text(
                  'Actors',
                  style: GoogleFonts.dmSans(
                    fontSize: 22,
                    color: AppColor.primaryTextColor,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 17),
                child: Container(
                  width: screenWidth * 0.9,
                  child: Text(
                    widget.Actors,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSans(
                      fontSize: 14,
                      color: AppColor.secondaryTextColor,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
