import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/resources/app_color.dart';
import 'package:shimmer/shimmer.dart';

class HorizontalScreen extends StatefulWidget {
  const HorizontalScreen({Key? key, this.ImageUrl = " ", required this.onPress})
      : super(key: key);

  final String ImageUrl;
  final VoidCallback? onPress;

  @override
  State<HorizontalScreen> createState() => _HorizontalScreenState();
}

class _HorizontalScreenState extends State<HorizontalScreen> {
  @override
  Widget build(BuildContext context) {
    print('This is Horizontal image Screen');
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: widget.onPress,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: EdgeInsets.only(top: 25),
              child: Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Center(
                        child: Container(
                          height: screenHeight * 0.25,
                          width: screenWidth * 0.89,
                          child: Image.network(
                            "https://image.tmdb.org/t/p/original${widget.ImageUrl}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        height: screenHeight * 0.25,
                        width: screenWidth * 0.89,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.8),
                            ])),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
