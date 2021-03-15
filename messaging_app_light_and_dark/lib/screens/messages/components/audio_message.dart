import 'package:flutter/material.dart';
import 'package:messaging_app_light_and_dark/constants.dart';
import 'package:messaging_app_light_and_dark/models/ChatMessage.dart';

class AudioMessage extends StatelessWidget {
  final ChatMessage message;

  const AudioMessage({Key key, this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding * 0.75, vertical: kDefaultPadding / 2.5),
      width: MediaQuery.of(context).size.width * 0.55,
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          Icon(
            Icons.play_arrow,
            color: message.isSender ? Colors.white : Colors.white,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    height: 2,
                    width: double.infinity,
                    color: message.isSender
                        ? Colors.white
                        : Colors.white.withOpacity(0.60),
                  ),
                  Positioned(
                    // left: message.isSender ? 124 : 0,
                    left: 0,
                    // right: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            message.voiceDuration,
            style: TextStyle(
                color: message.isSender ? Colors.white : Colors.white,
                fontSize: 12),
          )
        ],
      ),
    );
  }
}
