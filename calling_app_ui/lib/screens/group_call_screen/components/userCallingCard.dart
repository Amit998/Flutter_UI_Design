import 'package:calling_app_ui/screens/DailScreen/components/dailUserPic.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class UserCallingCard extends StatelessWidget {
  const UserCallingCard({
    Key key, this.img, this.text,
  }) : super(key: key);
  final String img;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgoundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DialUserPic(
            size: 112,
            image: img,
            
          ),
          VerticalSpacing(of: 12),
          Text(text, style: TextStyle(fontSize: 18, color: Colors.white)),
          VerticalSpacing(of: 5),
          Text("Calling...",
              style: TextStyle(fontSize: 10, color: Colors.white60)),
        ],
      ),
    );
  }
}
