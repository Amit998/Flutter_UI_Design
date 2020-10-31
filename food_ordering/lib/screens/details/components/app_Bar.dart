import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



AppBar detailsAppBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      icon: Icon(Icons.arrow_back,color: Colors.white,),
      onPressed: () {
        print("object");
      },
    ),
    actions: [
      IconButton(icon: SvgPicture.asset("assets/icons/share.svg"), onPressed: (){}),
      IconButton(icon: SvgPicture.asset("assets/icons/more.svg"), onPressed: (){})
    ],
    

  );
}