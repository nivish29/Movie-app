import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/auth.dart';
import 'package:movie_app/resources/FinalShimmer.dart';
import 'package:movie_app/resources/component/horizontal_image.dart';
import 'package:movie_app/model/pass_data.dart';
import 'package:movie_app/resources/shimmer.dart';
import 'package:movie_app/view_model/kids_popular_viewModel.dart';
import 'package:movie_app/view_model/trending_movie_viewModel.dart';
import 'package:provider/provider.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:movie_app/view_model/trending_movie_viewModel.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import '../data/responses/Status.dart';
import '../model/popular_TV_model.dart';
import '../resources/app_color.dart';
import '../resources/component/simple_horizontal_image.dart';
import '../utils/Routes/Route_name.dart';
import '../utils/utils.dart';
import '../view_model/popular_tv_viewModel.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, int> dataMap = {'n': 2, 'm': 3};
  DateTime timeBackPressed = DateTime.now();
  List<PopularTvModel> populartvm = [];

  trendingMovieViewModel trendingMovieVM = trendingMovieViewModel();
  popularTvViewModel popularTvVM = popularTvViewModel();
  kidsPopularViewModel kidsPopularVM = kidsPopularViewModel();

  @override
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    trendingMovieVM.fetchTrendingMovieApi();
    popularTvVM.FetchPopularTvList();
    kidsPopularVM.FetchkidsPopularList();
    super.initState();
    Future.delayed(const Duration(milliseconds: 1800), () {
      setState(() {
        _isLoading = false;
      });
    });

    // Timer(Duration(seconds: 2), () {
    //   setState(() {
    //     _isLoading = false;
    //   });
    // });
    // Future.delayed(Duration(seconds: 2), () {
    //   setState(() {
    //     _isLoading = false;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    print('This is Home Screen');
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return _isLoading
        ? ShimmerScreen()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColor.backgroundColor,
            extendBody: true,
            body: WillPopScope(
              onWillPop: () async {
                final difference = DateTime.now().difference(timeBackPressed);
                final exitWarning = difference >= Duration(seconds: 2);
                timeBackPressed = DateTime.now();
                if (exitWarning) {
                  Utils.flushBarErrorMessage(
                      'Press back again to exit', context);
                  return false;
                } else {
                  return true;
                }
              },
              child: SafeArea(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 45, left: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Top 5 Movies',
                                style: GoogleFonts.dmSans(
                                  fontSize: 18,
                                  color: AppColor.primaryTextColor,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.bold,
                                ),
                                // textAlign: TextAlign.start,
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(left: 130),
                                  child: InkWell(
                                    splashColor:
                                        Colors.transparent.withOpacity(0),
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, RouteName.searchScreen);
                                    },
                                    child: Container(
                                        height: 23,
                                        child: Image.asset(
                                          'lib/icons/find.png',
                                          color: AppColor.primaryTextColor,
                                        )),
                                  )),
                              Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: InkWell(
                                    splashColor:
                                        Colors.transparent.withOpacity(0),
                                    onTap: () {
                                      Auth().signOut().then(
                                          (value) => Navigator.pop(context));
                                    },
                                    child: Container(
                                        height: 27,
                                        child: Icon(
                                          Icons.logout,
                                          color: AppColor.primaryTextColor,
                                        )),
                                  )),
                            ],
                          )),
                      ChangeNotifierProvider<trendingMovieViewModel>(
                        create: (BuildContext context) => trendingMovieVM,
                        child: Consumer<trendingMovieViewModel>(
                            builder: (context, value, _) {
                          switch (value.movieList.status) {
                            case Status.LOADING:
                              return Text(value.movieList.message.toString());
                            case Status.ERROR:
                              return Text(value.movieList.message.toString());
                            case Status.COMPLETED:
                              return Container(
                                height: screenHeight * 0.31,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return HorizontalScreen(
                                        ImageUrl: value.movieList.data!
                                            .results![index].backdropPath
                                            .toString(),
                                        onPress: () {
                                          Navigator.pushNamed(
                                              context, RouteName.infoScreen,
                                              arguments: PassData(
                                                value.movieList.data!
                                                    .results![index].posterPath
                                                    .toString(),
                                                value.movieList.data!
                                                    .results![index].title
                                                    .toString(),
                                                value.movieList.data!
                                                    .results![index].releaseDate
                                                    .toString(),
                                                value
                                                    .movieList
                                                    .data!
                                                    .results![index]
                                                    .originalLanguage
                                                    .toString(),
                                                value
                                                    .movieList
                                                    .data!
                                                    .results![index]
                                                    .voteAverage!
                                                    .toDouble(),
                                                value.movieList.data!
                                                    .results![index].overview
                                                    .toString(),
                                              ));
                                        },
                                      );
                                    }),
                              );
                          }
                          return Container(
                            width: 0,
                            height: 0,
                          );
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, bottom: 24),
                        child: Text(
                          'Popular TV shows',
                          style: GoogleFonts.dmSans(
                            fontSize: 18,
                            color: AppColor.primaryTextColor,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold,
                          ),
                          // textAlign: TextAlign.start,
                        ),
                      ),
                      ChangeNotifierProvider<popularTvViewModel>(
                        create: (BuildContext context) => popularTvVM,
                        child: Consumer<popularTvViewModel>(
                            builder: (context, value, _) {
                          switch (value.TvList.status) {
                            case Status.LOADING:
                              return Text(value.TvList.message.toString());
                            case Status.ERROR:
                              return Text(value.TvList.message.toString());
                            case Status.COMPLETED:
                              return Container(
                                height: screenHeight * 0.26,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 15,
                                    itemBuilder: (context, index) {
                                      // print(value.TvList.data?.results?.length);

                                      return SimpleHorizontalScreen(
                                          ImageUrl: value.TvList.data!
                                              .results![index].posterPath
                                              .toString(),
                                          onPress: () {
                                            Navigator.pushNamed(
                                                context, RouteName.infoScreen,
                                                arguments: PassData(
                                                  value
                                                      .TvList
                                                      .data!
                                                      .results![index]
                                                      .backdropPath
                                                      .toString(),
                                                  value.TvList.data!
                                                      .results![index].name
                                                      .toString(),
                                                  value
                                                      .TvList
                                                      .data!
                                                      .results![index]
                                                      .firstAirDate
                                                      .toString(),
                                                  value
                                                      .TvList
                                                      .data!
                                                      .results![index]
                                                      .originalLanguage
                                                      .toString(),
                                                  value
                                                      .TvList
                                                      .data!
                                                      .results![index]
                                                      .voteAverage!
                                                      .toDouble(),
                                                  value.TvList.data!
                                                      .results![index].overview
                                                      .toString(),
                                                ));
                                          });

                                      return Container();
                                    }),
                              );
                          }
                          return Container();
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, bottom: 24),
                        child: Text(
                          'Popular Among Kids',
                          style: GoogleFonts.dmSans(
                            fontSize: 18,
                            color: AppColor.primaryTextColor,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold,
                          ),
                          // textAlign: TextAlign.start,
                        ),
                      ),
                      ChangeNotifierProvider<kidsPopularViewModel>(
                        create: (BuildContext context) => kidsPopularVM,
                        child: Consumer<kidsPopularViewModel>(
                            builder: (context, value, _) {
                          switch (value.kidsPopularList.status) {
                            case Status.LOADING:
                              return Text(
                                  value.kidsPopularList.message.toString());
                            case Status.ERROR:
                              return Text(
                                  value.kidsPopularList.message.toString());
                            case Status.COMPLETED:
                              return Container(
                                height: screenHeight * 0.31,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 15,
                                    itemBuilder: (context, index) {
                                      // print(value.TvList.data?.results?.length);

                                      return SimpleHorizontalScreen(
                                          ImageUrl: value.kidsPopularList.data!
                                              .results![index].posterPath
                                              .toString(),
                                          onPress: () {
                                            Navigator.pushNamed(
                                                context, RouteName.infoScreen,
                                                arguments: PassData(
                                                  value
                                                      .kidsPopularList
                                                      .data!
                                                      .results![index]
                                                      .backdropPath
                                                      .toString(),
                                                  value.kidsPopularList.data!
                                                      .results![index].title
                                                      .toString(),
                                                  value
                                                      .kidsPopularList
                                                      .data!
                                                      .results![index]
                                                      .releaseDate
                                                      .toString(),
                                                  value
                                                      .kidsPopularList
                                                      .data!
                                                      .results![index]
                                                      .originalLanguage
                                                      .toString(),
                                                  value
                                                      .kidsPopularList
                                                      .data!
                                                      .results![index]
                                                      .voteAverage!
                                                      .toDouble(),
                                                  value.kidsPopularList.data!
                                                      .results![index].overview
                                                      .toString(),
                                                ));
                                          });

                                      return Container();
                                    }),
                              );
                          }
                          return Container();
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Transform.scale(
                scale: 0.9,
                child: FloatingActionButton.extended(
                    label: Text(
                      'Camera',
                      style: TextStyle(fontSize: 12),
                    ),
                    icon: Icon(Icons.search_rounded),
                    backgroundColor: AppColor.flushbarColor,
                    onPressed: () {
                      Navigator.pushNamed(context, RouteName.mlSearchScreen);
                    }),
              ),
            ),
          );
  }
}
