import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/view_model/Provider/password_provider.dart';
import 'package:provider/provider.dart';

import '../app_color.dart';
import 'custom_Outline.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
    required this.strokeWidth,
    required this.strokeRadius,
    required this.controller,
    required this.textHint,
    // required this.obscure,
  }) : super(key: key);

  final double strokeWidth;
  final double strokeRadius;
  final String textHint;
  final TextEditingController controller;
  // final bool obscure;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  //search this link for explanation 'https://stackoverflow.com/questions/62433982/display-icon-in-textfield-when-not-empty'
//since my icon doesn't change if the controller is not empty, it only change when the keyboard is removed
//this means that we have to alter some setState and some of the initState with addListener

  changesOnField() {
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller.addListener(changesOnField);
  }

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
              child: ValueListenableBuilder(
                  valueListenable: _obscurePassword,
                  builder: (context, value, child) {
                    return TextFormField(
                      obscureText: _obscurePassword.value,
                      obscuringCharacter: '*',
                      style: GoogleFonts.dmSans(
                          color: AppColor.primaryTextColor,
                          textStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
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
                            Icons.lock,
                            color: AppColor.primaryTextColor,
                          ),
                          suffixIcon: InkWell(
                            onTap: () {
                              _obscurePassword.value = !_obscurePassword.value;
                            },
                            child: Icon(
                                widget.controller.text.isEmpty
                                    ? null
                                    : _obscurePassword.value
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility,
                                color: AppColor.primaryTextColor),
                          )),
                    );
                  })),
          // child:
          //     Consumer<PasswordProvider>(builder: (context, value, child) {
          //   return TextFormField(
          //     obscureText: value.setObscurePassword(),
          //     obscuringCharacter: '*',
          //     style: GoogleFonts.dmSans(
          //         color: AppColor.primaryTextColor,
          //         textStyle:
          //             TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          //     controller: widget.controller,
          //     textAlign: TextAlign.start,
          //     decoration: InputDecoration(
          //         border: InputBorder.none,
          //         hintText: widget.textHint,
          //         hintStyle: TextStyle(
          //             color: AppColor.hintTextColor,
          //             fontSize: 16,
          //             fontWeight: FontWeight.normal),
          //         prefixIcon: Icon(
          //           Icons.lock,
          //           color: AppColor.primaryTextColor,
          //         ),
          //         suffixIcon: InkWell(
          //           onTap: () {
          //             // _obscurePassword.value = !_obscurePassword.value;
          //             value.setObscurePassword() ==
          //                 !value.setObscurePassword();
          //           },
          //           child: Icon(
          //               widget.controller.text.isEmpty
          //                   ? null
          //                   : value.setObscurePassword()
          //                       ? Icons.visibility_off_outlined
          //                       : Icons.visibility,
          //               color: AppColor.primaryTextColor),
          //         )),
          //   );
          // }),
        ),
      ),
    );
  }
}
