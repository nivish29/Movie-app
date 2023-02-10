// import 'dart:async';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:movie_app/resources/component/horizontal_image.dart';
// import 'package:movie_app/resources/shimmer.dart';
// import 'package:movie_app/view_model/trending_movie_viewModel.dart';
// import 'package:provider/provider.dart';
// import 'package:scroll_snap_list/scroll_snap_list.dart';
// import 'package:movie_app/view_model/trending_movie_viewModel.dart';
// import 'package:sentry_flutter/sentry_flutter.dart';
// import '../data/responses/Status.dart';
// import '../resources/app_color.dart';
// import '../resources/component/simple_horizontal_image.dart';
// import '../view_model/popular_tv_viewModel.dart';
//
// class TestScreen extends StatefulWidget {
//   const TestScreen({Key? key}) : super(key: key);
//
//   @override
//   State<TestScreen> createState() => _TestScreenState();
// }
//
// class _TestScreenState extends State<TestScreen> {
//   trendingMovieViewModel trendingMovieVM = trendingMovieViewModel();
//   popularTvViewModel popularTvVM = popularTvViewModel();
//
//   @override
//   bool _isLoading = true;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     trendingMovieVM.fetchTrendingMovieApi();
//     popularTvVM.FetchPopularTvList();
//     super.initState();
//
//     Timer(Duration(seconds: 2), () {
//       setState(() {
//         _isLoading = false;
//       });
//     });
//     Future.delayed(Duration(seconds: 2), () {
//       setState(() {
//         _isLoading = false;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print('This is Home Screen');
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: AppColor.backgroundColor,
//       extendBody: true,
//       // body: SizedBox(
//       // child: Column(
//       //   children: [
//       //     Expanded(
//       // child: ListView.builder(
//       //     shrinkWrap: true,
//       //     scrollDirection: Axis.horizontal,
//       //     itemCount: 5,
//       //     itemBuilder: (context, index) {
//       //       return Card();
//       //     }),
//       // )
//       //   ],
//       // ),
//       // child: HorizontalScreen(),
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 45, left: 30),
//               child: Text(
//                 'Top 5 Movies',
//                 style: GoogleFonts.dmSans(
//                   fontSize: 18,
//                   color: AppColor.primaryTextColor,
//                   decoration: TextDecoration.none,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 // textAlign: TextAlign.start,
//               ),
//             ),
//             ChangeNotifierProvider<popularTvViewModel>(
//               create: (BuildContext context) => popularTvVM,
//               child: Consumer<popularTvViewModel>(builder: (context, value, _) {
//                 switch (value.TvList.status) {
//                   case Status.LOADING:
//                     return CircularProgressIndicator();
//                   case Status.ERROR:
//                     return Text(value.TvList.message.toString());
//                   case Status.COMPLETED:
//                     return Expanded(
//                       child: ListView.builder(
//                           shrinkWrap: true,
//                           scrollDirection: Axis.horizontal,
//                           itemCount: 5,
//                           itemBuilder: (context, index) {
//                             return SimpleHorizontalScreen(
//                                 ImageUrl: value
//                                     .TvList.data!.results![index]!.posterPath
//                                     .toString());
//                           }),
//                     );
//                 }
//                 return Container();
//               }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
