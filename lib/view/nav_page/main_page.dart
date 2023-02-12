import 'package:flutter/material.dart';
import 'package:movie_app/resources/app_color.dart';
import 'package:movie_app/resources/FinalShimmer.dart';
import 'package:movie_app/view/find_friends.dart';
import 'package:movie_app/view/homeScreen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  List Pages = [HomeScreen(), FindFriendScreen()];
  // List Pages = [HomeScreen(), ShimmerScreen()];

  int curIdx = 0;
  void onTap(int index) {
    setState(() {
      curIdx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Pages[curIdx],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFF060E18),
          onTap: onTap,
          currentIndex: curIdx,
          selectedFontSize: 12,
          unselectedFontSize: 0,
          selectedItemColor: Color(0xFFD98C7B),
          unselectedItemColor: Color(0xFF626465),
          showSelectedLabels: true,
          showUnselectedLabels: false,
          elevation: 0,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.task_rounded), label: 'Users')
          ]),
    );
  }
}
