import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/resources/component/round_button.dart';
import 'package:movie_app/resources/component/textField.dart';
import 'package:movie_app/view/loginScreen.dart';

import '../auth.dart';
import '../resources/app_color.dart';
import '../resources/component/blurred_bg.dart';
import '../resources/component/password_textfield.dart';
import '../utils/Routes/Route_name.dart';
import '../utils/utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool loading = false;
  String? errorMessage = '';
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _reEnterPasswordController = TextEditingController();

  // Future<void> createUserWithEmailAndPassword() async {
  //   try {
  //     await Auth().createUserWithEmailAndPassword(
  //         email: _emailController.text, password: _passwordController.text);
  //   } on FirebaseAuthException catch (e) {
  //     setState(() {
  //       errorMessage = e.message;
  //     });
  //   }
  //   print(errorMessage);
  // }

  void login() {
    setState(() {
      loading = true;
    });
    _auth
        .createUserWithEmailAndPassword(
            // email: emailController.text.toString(),
            email: _emailController.text.toString(),
            password: _passwordController.text.toString())
        .then((value) async {
      User? user = FirebaseAuth.instance.currentUser;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("User Registered"),
      ));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
      setState(() {
        // CircularProgressIndicator();
        loading = false;
      });
    }).onError((error, stackTrace) {
      print('Error is: $error');
      setState(() {
        loading = false;
      });
    });
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
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign Up',
                    // style: TextStyle(
                    //   fontSize: 28,
                    //   color: AppColor.PrimaryTextColor,
                    // ),
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
                  Center(
                    child: PasswordTextField(
                      strokeWidth: 1.5,
                      strokeRadius: 20,
                      controller: _reEnterPasswordController,
                      textHint: 'Re-Enter Password',
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.09,
                  ),
                  Center(
                    child: RoundButton(
                      strokeWidth: 2.5,
                      strokeRadius: screenWidth * 0.7,
                      text: 'Sign Up',
                      fontSize: 14,
                      textColor: AppColor.primaryTextColor,
                      fontWeight: FontWeight.bold,
                      onPress: () {
                        // Navigator.pushNamed(context, RouteName.signUp);

                        // Utils.flushBarErrorMessage('Signing Up', context);
                        login();
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
                        'Already have an account?',
                        style: TextStyle(
                            color: AppColor.primaryTextColor, fontSize: 15),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Login',
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
