import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/resources/component/horizontal_image.dart';
import 'package:movie_app/model/pass_data.dart';
import 'package:movie_app/utils/Routes/Route_name.dart';
import 'package:movie_app/view/entryScreen.dart';
import 'package:movie_app/view/homeScreen.dart';
import 'package:movie_app/view/infoScreen.dart';
import 'package:movie_app/view/loginScreen.dart';
import 'package:movie_app/view/searchScreen.dart';
import 'package:movie_app/view/signUpScreen.dart';
import 'package:movie_app/view/test_screen.dart';
import 'package:page_transition/page_transition.dart';

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
        // return MaterialPageRoute(builder: (context) => SignUpScreen());
        return PageTransition(
            child: SearchScreen(),
            type: PageTransitionType.fade,
            duration: Duration(milliseconds: 300),
            reverseDuration: Duration(milliseconds: 300));

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
