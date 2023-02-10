import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/app_color.dart';
import '../resources/component/textField.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  strokeWidth: 2,
                  strokeRadius: 20,
                  controller: _searchController,
                  textHint: 'Search Movie',
                ),
              ],
            ),
          ),
        ));
  }
}
