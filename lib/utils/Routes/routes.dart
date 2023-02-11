import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/model/actor_passData.dart';
import 'package:movie_app/model/search_pass_data.dart';
import 'package:movie_app/resources/component/horizontal_image.dart';
import 'package:movie_app/model/pass_data.dart';
import 'package:movie_app/utils/Routes/Route_name.dart';
import 'package:movie_app/view/actorInfoScreen.dart';
import 'package:movie_app/view/entryScreen.dart';
import 'package:movie_app/view/homeScreen.dart';
import 'package:movie_app/view/infoScreen.dart';
import 'package:movie_app/view/loginScreen.dart';
import 'package:movie_app/view/searchInfoScreen.dart';
import 'package:movie_app/view/searchScreen.dart';
import 'package:movie_app/view/signUpScreen.dart';
import 'package:movie_app/view/test_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../../view/slidingFragmentScreen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.entry:
        return MaterialPageRoute(builder: (context) => EntryScreen());

      case RouteName.login:
        // return MaterialPageRoute(builder: (context) => LoginScreen());
        return PageTransition(
            child: LoginScreen(),
            type: PageTransitionType.fade,
            duration: Duration(milliseconds: 200),
            reverseDuration: Duration(milliseconds: 200));

      case RouteName.signUp:
        // return MaterialPageRoute(builder: (context) => SignUpScreen());
        return PageTransition(
            child: SignUpScreen(),
            type: PageTransitionType.fade,
            duration: Duration(milliseconds: 300),
            reverseDuration: Duration(milliseconds: 300));

      case RouteName.home:
        // return MaterialPageRoute(builder: (context) => SignUpScreen());
        return PageTransition(
            child: HomeScreen(),
            type: PageTransitionType.fade,
            duration: Duration(milliseconds: 300),
            reverseDuration: Duration(milliseconds: 300));

      case RouteName.searchScreen:
        // final search_args = settings.arguments as SearchPassData;
        // return MaterialPageRoute(builder: (context) => SignUpScreen());
        return PageTransition(
            child: SearchScreen(),
            type: PageTransitionType.fade,
            duration: Duration(milliseconds: 300),
            reverseDuration: Duration(milliseconds: 300));

      case RouteName.searchInfoScreen:
        final search_args = settings.arguments as SearchPassData;
        // return MaterialPageRoute(builder: (context) => SignUpScreen());
        return PageTransition(
            child: SearchInfoScreen(
                ImageUrl: search_args.ImageUrl,
                title: search_args.title,
                date: search_args.Date,
                language: search_args.Language,
                vote_average: search_args.rating,
                plot: search_args.plot,
                Genre: search_args.genre,
                Actors: search_args.Cast,
                Country: search_args.country
                // jsonData: search_args.jsonData,
                ),
            type: PageTransitionType.fade,
            duration: Duration(milliseconds: 300),
            reverseDuration: Duration(milliseconds: 300));

      case RouteName.actorInfoScreen:
        final search_args = settings.arguments as ActorPassData;
        // return MaterialPageRoute(builder: (context) => SignUpScreen());
        return PageTransition(
            child: ActorInfoScreen(
              profile_path: search_args.profile_path,
              name: search_args.name,
              title1: search_args.title1,
              overview1: search_args.overview1,
              title2: search_args.title2,
              overview2: search_args.overview2, title3: search_args.title3,
              overview3: search_args.overview3,
              // jsonData: search_args.jsonData,
            ),
            type: PageTransitionType.fade,
            duration: Duration(milliseconds: 300),
            reverseDuration: Duration(milliseconds: 300));

      // case RouteName.slidingScreen:
      //   final search_args = settings.arguments as SearchPassData;
      //   return PageTransition(
      //       child: SlidingFragment(
      //         title: search_args.title,
      //       ),
      //       type: PageTransitionType.fade,
      //       duration: Duration(milliseconds: 300),
      //       reverseDuration: Duration(milliseconds: 300));

      // case RouteName.horizontalImage:
      //   // return MaterialPageRoute(builder: (context) => SignUpScreen());
      //   return PageTransition(
      //       child: HorizontalScreen(),
      //       type: PageTransitionType.fade,
      //       duration: Duration(milliseconds: 300),
      //       reverseDuration: Duration(milliseconds: 300));

      case RouteName.infoScreen:
        final args = settings.arguments as PassData;
        // return MaterialPageRoute(builder: (context) => SignUpScreen());
        return PageTransition(
            child: InfoScreen(
              ImageUrl: args.ImageUrl,
              title: args.title,
              date: args.date,
              language: args.language,
              vote_average: args.voteAverage,
              plot: args.plot,
            ),
            type: PageTransitionType.fade,
            duration: Duration(milliseconds: 300),
            reverseDuration: Duration(milliseconds: 300));
      // return MaterialPageRoute(builder: (context) {
      //   return InfoScreen(
      //     Name: args.Name,
      //   );
      // });

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No routes found'),
            ),
          );
        });
    }
  }
}
