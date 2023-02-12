import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/model/userModel.dart';
import 'package:movie_app/resources/app_url.dart';
import 'package:movie_app/resources/component/changing_textfield.dart';
import 'package:movie_app/view/find_friends.dart';

import '../resources/app_color.dart';
import '../resources/component/blurred_bg.dart';
import '../resources/component/round_button.dart';
import '../resources/component/textField.dart';
import '../utils/Routes/Route_name.dart';
import '../utils/utils.dart';
import 'package:http/http.dart' as http;

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  List<user> userList = [];

  Future<void> fetchData() async {
    try {
      http.Response response =
          await http.get(Uri.parse('http://192.168.1.89:8000/user/'));
      var data = jsonDecode(response.body);
      // print(data.runtimeType);
      data.forEach(
        (t) {
          user u = user(t['name'], t['whatsapp_number'],
              t['instagram_username'], t['discord_username']);
          userList.add(u);
        },
      );
      setState(() {});
      print(userList.length);
      print(data);
    } catch (e) {
      print('error is: $e');
    }
  }

  Future<void> postData(
      {String name = '',
      String whatsAppNumber = '',
      String instaId = '',
      String discordId = ''}) async {
    try {
      http.Response response = await http.post(
        Uri.parse(AppUrl.getUserEndPoint),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "name": name,
          "whatsapp_number": whatsAppNumber,
          "instagram_username": instaId,
          "discord_username": discordId
        }),
        // encoding: Encoding.getByName("utf-8")
      );

      if (response.statusCode == 201) {
        setState(() {
          userList = [];
        });
        fetchData();
      } else {
        throw Exception('Failed to create album.');
      }
    } catch (e) {
      print("Error is $e");
    }
  }

  TextEditingController _nameController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _instaIdController = TextEditingController();
  TextEditingController _DiscordIdController = TextEditingController();

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
                    'Add Up Yourself',
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
                    child: ChangingCustomTextField(
                      strokeWidth: 2,
                      strokeRadius: 20,
                      controller: _nameController,
                      textHint: 'Name',
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Center(
                    child: ChangingCustomTextField(
                      strokeWidth: 2,
                      strokeRadius: 20,
                      controller: _numberController,
                      textHint: 'Whatsapp Number',
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Center(
                    child: ChangingCustomTextField(
                      strokeWidth: 2,
                      strokeRadius: 20,
                      controller: _instaIdController,
                      textHint: 'Instagram id',
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Center(
                    child: ChangingCustomTextField(
                      strokeWidth: 2,
                      strokeRadius: 20,
                      controller: _DiscordIdController,
                      textHint: 'Discord id',
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.06,
                  ),
                  Center(
                    child: RoundButton(
                      strokeWidth: 2.5,
                      strokeRadius: screenWidth * 0.7,
                      text: 'Create Yourself',
                      fontSize: 14,
                      textColor: AppColor.primaryTextColor,
                      fontWeight: FontWeight.bold,
                      onPress: () {
                        // Navigator.pushNamed(context, RouteName.signUp);
                        postData(
                          name: _nameController.text.toString(),
                          whatsAppNumber: _numberController.text.toString(),
                          instaId: _instaIdController.text.toString(),
                          discordId: _DiscordIdController.text.toString(),
                        );
                        print(_nameController.text.toString());
                        // Utils.flushBarErrorMessage('Signing Up', context);
                        setState(() {});
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              )),
            )),
          ],
        ),
      ),
    );
  }
}
