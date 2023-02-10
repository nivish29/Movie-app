import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/resources/app_color.dart';
import 'package:shimmer/shimmer.dart';

class SimpleHorizontalScreen extends StatefulWidget {
  SimpleHorizontalScreen({Key? key, this.ImageUrl = " ", this.onPress})
      : super(key: key);

  late final String ImageUrl;
  final VoidCallback? onPress;

  @override
  State<SimpleHorizontalScreen> createState() => _SimpleHorizontalScreenState();
}

class _SimpleHorizontalScreenState extends State<SimpleHorizontalScreen> {
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
              padding: EdgeInsets.only(top: 0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Center(
                        child: Container(
                          height: screenHeight * 0.23,
                          width: screenWidth * 0.4,
                          child: Image.network(
                            "https://image.tmdb.org/t/p/w500/${widget.ImageUrl}",
                            // widget.ImageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        height: screenHeight * 0.23,
                        width: screenWidth * 0.4,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              Colors.black.withOpacity(0.2),
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
        SizedBox(
          height: 14,
        ),
      ],
    );
  }
}
