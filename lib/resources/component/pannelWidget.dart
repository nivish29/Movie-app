// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class PanelWidget extends StatefulWidget {
//   final ScrollController controller;
//   final String title;
//   const PanelWidget({Key? key, required this.controller, required this.title})
//       : super(key: key);
//
//   @override
//   State<PanelWidget> createState() => _PanelWidgetState();
// }
//
// class _PanelWidgetState extends State<PanelWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           gradient: LinearGradient(
//         begin: Alignment.topLeft,
//         end: Alignment.bottomCenter,
//         colors: [Colors.black.withOpacity(0.1), Colors.black.withOpacity(0.7)],
//       )),
//       child: ListView(
//         controller: widget.controller,
//         children: [
//           Column(
//             children: [
//               Align(
//                 alignment: Alignment.topCenter,
//                 child: Container(
//                   width: 40,
//                   height: 5,
//                   decoration: BoxDecoration(
//                       color: Colors.grey.withOpacity(0.5),
//                       borderRadius: BorderRadius.circular(20)),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Text('${widget.title}'),
//               Text('date of release'),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
