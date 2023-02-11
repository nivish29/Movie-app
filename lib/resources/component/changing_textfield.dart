import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_color.dart';
import 'custom_Outline.dart';

class ChangingCustomTextField extends StatefulWidget {
  const ChangingCustomTextField({
    Key? key,
    required this.strokeWidth,
    required this.strokeRadius,
    required this.controller,
    required this.textHint,
    this.obsecure = false,
  }) : super(key: key);

  final double strokeWidth;
  final double strokeRadius;
  final String textHint;
  final TextEditingController controller;
  final bool obsecure;

  @override
  State<ChangingCustomTextField> createState() =>
      _ChangingCustomTextFieldState();
}

class _ChangingCustomTextFieldState extends State<ChangingCustomTextField> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return CustomOutline(
      strokeWidth: widget.strokeWidth,
      radius: widget.strokeRadius,
      width: screenWidth * 0.88,
      height: screenHeight * 0.07,
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
          child: Padding(
            padding: const EdgeInsets.only(left: 0),
            child: TextFormField(
              obscureText: widget.obsecure,
              obscuringCharacter: '*',
              style: GoogleFonts.dmSans(
                  color: AppColor.primaryTextColor,
                  textStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              controller: widget.controller,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.textHint,
                hintStyle: TextStyle(
                    color: AppColor.hintTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
                prefixIcon: Icon(
                  Icons.alternate_email,
                  color: AppColor.primaryTextColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
