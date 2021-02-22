// import 'package:flutter/material.dart';
// import 'package:shoe_shop_app/pages/detail_page.dart';

// class Body extends StatelessWidget {
//   const Body({
//     Key key,
//     @required this.widget,
//   }) : super(key: key);

//   final DetailPage widget;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width,
//       child: Stack(
//         children: [
//           Positioned(
//             bottom: 0,
//             child: Container(
//               height: MediaQuery.of(context).size.height * 0.75,
//               width: MediaQuery.of(context).size.width,
//               child: ClipPath(
//                 clipper: AppClipper(
//                     cornerSize: 50, diagonalHeight: 180, roundedBottom: false),
//                 child: Container(
//                   color: Colors.white,
//                   padding: EdgeInsets.only(top: 200, left: 6, right: 20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         width: 300,
//                         padding: EdgeInsets.symmetric(horizontal: 20),
//                         child: Text(
//                           "${widget.shoeModel.name}",
//                           style: TextStyle(fontSize: 32),
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       _buildRating(),
//                       SizedBox(height: 24),
//                       Text(
//                         "DETAILS",
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(height: 24),
//                       Text(
//                         "${widget.shoeModel.desc}",
//                         style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black45),
//                       ),
//                       SizedBox(height: 24),
//                       Text(
//                         "COLORS OPTIONS",
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                       Row(
//                         children: [
//                           _buildColoeOptions(Colors.blue),
//                           _buildColoeOptions(Colors.red),
//                           _buildColoeOptions(Colors.yellow),
//                           _buildColoeOptions(Colors.orangeAccent),
//                           _buildColoeOptions(Colors.greenAccent),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             child: BottamNavBar(widget: widget),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 50),
//             child: Transform.rotate(
//               angle: -math.pi / 7,
//               child: Image(
//                 width: MediaQuery.of(context).size.width * 0.9,
//                 image: AssetImage("assets/${widget.shoeModel.imgPath}"),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }