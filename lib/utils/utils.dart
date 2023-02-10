import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/resources/app_color.dart';

class Utils {
  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        flushbarStyle: FlushbarStyle.FLOATING,
        forwardAnimationCurve: Curves.decelerate,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: EdgeInsets.all(20),
        message: message,
        backgroundColor: AppColor.flushbarColor,
        duration: Duration(milliseconds: 1500),
        reverseAnimationCurve: Curves.easeOutBack,
        positionOffset: 20,
        borderRadius: BorderRadius.circular(15),
        icon: Icon(
          Icons.error,
          color: Colors.white,
        ),
        flushbarPosition: FlushbarPosition.BOTTOM,
      )..show(context),
    );
  }
}
