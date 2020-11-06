import 'package:calling_app_ui/constants.dart';
import 'package:calling_app_ui/screens/DailScreen/components/dailUserPic.dart';
import 'package:calling_app_ui/screens/group_call_screen/components/userCallingCard.dart';
import 'package:calling_app_ui/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: demoData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.53,
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemBuilder: (context, index) => demoData[index]['isCalling']
          ? UserCallingCard(
              text: demoData[index]["name"], img: demoData[index]["image"])
          : Image.asset(
            demoData[index]["image"],
            fit: BoxFit.cover,
            
            )
          
          ,
    );
  }
}

// Container(
//       width: SizeConfig.screenWidth / 2,
//       child: AspectRatio(
//         aspectRatio: .53,
//         child: UserCallingCard(
//           img: "assets/images/group_call_face_small.png",
//           text: "Jhon Doe",

//         ),

//       ),

//     );

List<Map<String, dynamic>> demoData = [
  {
    "isCalling": false,
    "name": "User 1",
    "image": "assets/images/goup_call_1.png",
  },
  {
    "isCalling": true,
    "name": "Steve jon",
    "image": "assets/images/group_call_face_small.png",
  },
  {
    "isCalling": false,
    "name": "User 1",
    "image": "assets/images/group_call_face_2.png",
  },
  {
    "isCalling": false,
    "name": "User 1",
    "image": "assets/images/group_call_face_3.png",
  },
];
