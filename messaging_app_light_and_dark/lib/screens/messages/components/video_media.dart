import 'package:flutter/material.dart';
import 'package:messaging_app_light_and_dark/constants.dart';
import 'package:messaging_app_light_and_dark/models/ChatMessage.dart';

class VideoMedia extends StatelessWidget {
  final ChatMessage message;

  const VideoMedia({Key key, this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: AspectRatio(
        aspectRatio: 1.6,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset("assets/images/Video Place Here.png"),
            ),
            Positioned(
              // top: 0,
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.5),
                    shape: BoxShape.circle),
                child: Icon(
                  Icons.play_arrow,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
