// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:movie_app/resources/app_color.dart';
// import 'package:movie_app/view/searchScreen.dart';
// import 'package:sliding_up_panel/sliding_up_panel.dart';
//
// import '../resources/component/pannelWidget.dart';
//
// class SlidingFragment extends StatefulWidget {
//   final String title;
//   const SlidingFragment({
//     Key? key,
//     this.title = '',
//   }) : super(key: key);
//
//   @override
//   State<SlidingFragment> createState() => _SlidingFragmentState();
// }
//
// class _SlidingFragmentState extends State<SlidingFragment> {
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SlidingUpPanel(
//         color: Color(0xFF202122),
//         minHeight: screenHeight * 0.2,
//         maxHeight: screenHeight * 0.6,
//         // parallaxEnabled: true,
//         // parallaxOffset: .2,
//         body: SearchScreen(),
//         panelBuilder: (controller) => PanelWidget(
//           controller: controller,
//           title: widget.title,
//         ),
//         borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
//         // border: Border.all(width: 1, color: Colors.white.withOpacity(0.3)),
//       ),
//     );
//   }
// }
