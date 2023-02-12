import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animated_icons/flutter_animated_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/resources/app_url.dart';
import 'package:movie_app/resources/component/user_Container.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/userModel.dart';
import '../model/userModel.dart';
import '../model/userModel.dart';
import '../resources/app_color.dart';
import 'package:http/http.dart' as http;

import '../utils/Routes/Route_name.dart';
// import '../model/Routes/userModel.dart';

//10.0.2.2:8000 it is a local host for android

class FindFriendScreen extends StatefulWidget {
  const FindFriendScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FindFriendScreen> createState() => _FindFriendScreenState();
}

class _FindFriendScreenState extends State<FindFriendScreen> {
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

  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('this is findFriends Screen');
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 45, left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Watch with Friends',
                      style: GoogleFonts.dmSans(
                        fontSize: 18,
                        color: AppColor.primaryTextColor,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                      ),
                      // textAlign: TextAlign.start,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: InkWell(
                          splashColor: Colors.transparent.withOpacity(0),
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(RouteName.addUserScreen)
                                .then((_) => setState(() {}));
                          },
                          child: Container(
                              height: 27,
                              child: Image.asset(
                                'lib/icons/add.png',
                                color: AppColor.primaryTextColor,
                              )),
                        )),
                  ],
                )),
            SizedBox(
              height: screenHeight * 0.06,
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  // Navigator.pushReplacement(context,
                  //     PageRouteBuilder(pageBuilder: (a, b, c) => MyApp()));
                  // await Future.delayed(Duration(milliseconds: 1000));
                  userList = [];
                  await fetchData();
                },
                child: ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return UserContainer(
                        name: userList[index].name,
                        number: userList[index].number,
                        insta_id: userList[index].insta_id,
                        discord_id: userList[index].discord_id);
                  },
                ),
              ),
            ),
            // Expanded(
            //   child: ListView(
            //     children: userList.map((e) {
            //       return UserContainer(
            //           name: 'name',
            //           number: 'number',
            //           insta_id: 'insta_id',
            //           discord_id: 'discord_id');
            //     }).toList(),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
