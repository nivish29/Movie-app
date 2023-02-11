import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/network/NetworkApiServices.dart';
import 'package:movie_app/model/actor_passData.dart';
import 'package:movie_app/model/search_Model.dart';
import 'package:movie_app/model/search_pass_data.dart';
import 'package:movie_app/view/actorInfoScreen.dart';
import 'package:movie_app/view/searchInfoScreen.dart';
import 'package:movie_app/view/slidingFragmentScreen.dart';
import 'package:movie_app/view_model/search_viewModel.dart';
import 'package:provider/provider.dart';

import '../data/responses/Status.dart';
import '../resources/app_color.dart';
import '../resources/component/round_button.dart';
import '../resources/component/textField.dart';
import '../utils/Routes/Route_name.dart';
import '../utils/utils.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late String Data;
  SearchViewModel searchViewModel = SearchViewModel();
  TextEditingController _searchController = TextEditingController();
  TextEditingController _searchActorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(top: 250),
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
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Text(
                  'Or',
                  style: TextStyle(color: AppColor.primaryTextColor),
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                CustomTextField(
                  strokeWidth: 2,
                  strokeRadius: 20,
                  controller: _searchActorController,
                  textHint: 'Search Any Actor',
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RoundButton(
                          strokeWidth: 2.5,
                          strokeRadius: screenWidth * 0.7,
                          text: 'Movie',
                          fontSize: 14,
                          textColor: AppColor.primaryTextColor,
                          fontWeight: FontWeight.bold,
                          onPress: () async {
                            Utils.flushBarErrorMessage('Searching', context);
                            //
                            Data = _searchController.text.toString();
                            // setState(() {});
                            // searchViewModel.fetchSearchList(Data);

                            final jsonData = await NetworkApiServices()
                                .getGetApiResponse(
                                    'http://www.omdbapi.com/?apikey=8cd8bd93&t=$Data');
                            //
                            // print(jsonData['Title'].toString());
                            // print(jsonData['Ratings'][0]['Value']);
                            Navigator.pushNamed(
                                context, RouteName.searchInfoScreen,
                                arguments: SearchPassData(
                                  jsonData['Poster'].toString(),
                                  jsonData['Title'].toString(),
                                  jsonData['Released'].toString(),
                                  jsonData['Language'].toString(),
                                  double.parse(jsonData['imdbRating']),
                                  jsonData['Plot'].toString(),
                                  jsonData['Genre'].toString(),
                                  jsonData['Actors'].toString(),
                                  jsonData['Country'].toString(),
                                ));

                            // print(searchViewModel.searchList.data?.Title.toString());

                            // Navigator.pushNamed(context, RouteName.horizontalImage);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RoundButton(
                          strokeWidth: 2.5,
                          strokeRadius: screenWidth * 0.7,
                          text: 'Actor',
                          fontSize: 14,
                          textColor: AppColor.primaryTextColor,
                          fontWeight: FontWeight.bold,
                          onPress: () async {
                            Utils.flushBarErrorMessage('Searching', context);
                            //
                            Data = _searchActorController.text.toString();
                            // setState(() {});
                            // searchViewModel.fetchSearchList(Data);

                            final jsonData = await NetworkApiServices()
                                .getGetApiResponse(
                                    'https://api.themoviedb.org/3/search/person?api_key=74e83e30dbb2f3b125c2132c5cebb053&language=en-US&query=$Data');
                            //

                            print(jsonData['results'][0]['profile_path']
                                .toString());
                            // print(jsonData['Ratings'][0]['Value']);
                            Navigator.pushNamed(
                                context, RouteName.actorInfoScreen,
                                arguments: ActorPassData(
                                  jsonData['results'][0]['profile_path']
                                      .toString(),
                                  jsonData['results'][0]['name'].toString(),
                                  jsonData['results'][0]['known_for'][0]
                                          ['title']
                                      .toString(),
                                  jsonData['results'][0]['known_for'][0]
                                          ['overview']
                                      .toString(),
                                  jsonData['results'][0]['known_for'][1]
                                          ['title']
                                      .toString(),
                                  jsonData['results'][0]['known_for'][1]
                                          ['overview']
                                      .toString(),
                                  jsonData['results'][0]['known_for'][2]
                                          ['title']
                                      .toString(),
                                  jsonData['results'][0]['known_for'][2]
                                          ['overview']
                                      .toString(),
                                ));

                            // print(searchViewModel.searchList.data?.Title.toString());

                            // Navigator.pushNamed(context, RouteName.horizontalImage);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
