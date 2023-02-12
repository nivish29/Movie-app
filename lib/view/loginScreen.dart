import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/auth.dart';
import 'package:movie_app/resources/component/round_button.dart';
import 'package:movie_app/resources/component/textField.dart';
import 'package:movie_app/view/nav_page/main_page.dart';

import '../resources/app_color.dart';
import '../resources/component/blurred_bg.dart';
import '../resources/component/password_textfield.dart';
import '../utils/Routes/Route_name.dart';
import '../utils/utils.dart';
import 'homeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? errorMessage = '';
  bool isLogin = true;
  // ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth()
          .signInWithEmailAndPassword(
              email: _emailController.text.toString(),
              password: _passwordController.text.toString())
          .then((value) => Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainPage())));
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }
  //

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
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
              child: const BlurredBg(
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
                child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: SizedBox(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Login',
                    style: GoogleFonts.dmSans(
                      fontSize: 36,
                      color: AppColor.primaryTextColor,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: screenHeight * 0.09,
                  ),
                  Center(
                    child: CustomTextField(
                      strokeWidth: 2,
                      strokeRadius: 20,
                      controller: _emailController,
                      textHint: 'Enter Email',
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Center(
                    child: PasswordTextField(
                      strokeWidth: 2,
                      strokeRadius: 20,
                      controller: _passwordController,
                      textHint: 'Enter Password',
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  SizedBox(
                    height: screenHeight * 0.06,
                  ),
                  Center(
                    child: RoundButton(
                      strokeWidth: 2.5,
                      strokeRadius: screenWidth * 0.7,
                      text: 'Login',
                      fontSize: 14,
                      textColor: AppColor.primaryTextColor,
                      fontWeight: FontWeight.bold,
                      onPress: () {
                        Utils.flushBarErrorMessage('Loging you in', context);
                        signInWithEmailAndPassword();
                        // Navigator.pushNamed(context, RouteName.MainPageScreen);
                        // Navigator.pushNamed(context, RouteName.horizontalImage);
                      },
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.015,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                            color: AppColor.primaryTextColor, fontSize: 15),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RouteName.signUp);
                          // signIn();
                        },
                        child: Text(
                          'Sign Up',
                          style:
                              TextStyle(color: Color(0xFF0085FF), fontSize: 15),
                        ),
                      ),
                    ],
                  )
                ],
              )),
            )),
          ],
        ),
      ),
    );
  }
}
