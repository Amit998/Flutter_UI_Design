import 'package:flutter/material.dart';
import 'package:messaging_app_light_and_dark/constants.dart';
import 'package:messaging_app_light_and_dark/models/ChatMessage.dart';
import 'package:messaging_app_light_and_dark/screens/messages/components/audio_message.dart';
import 'package:messaging_app_light_and_dark/screens/messages/components/message_status.dart';
import 'package:messaging_app_light_and_dark/screens/messages/components/text_messages.dart';
import 'package:messaging_app_light_and_dark/screens/messages/components/video_media.dart';
// import '../components/';

class Message extends StatelessWidget {
  const Message({
    Key key,
    @required this.chatMessage,
  }) : super(key: key);

  final ChatMessage chatMessage;

  @override
  Widget build(BuildContext context) {
    Widget messageContaint(ChatMessage message) {
      switch (message.messageType) {
        case ChatMessageType.text:
          return TextMessage(
            message: chatMessage,
          );
          break;
        case ChatMessageType.image:
          return Text("Image");
        case ChatMessageType.audio:
          return AudioMessage(
            message: message,
          );
        case ChatMessageType.video:
          return VideoMedia(message: message);

        default:
          return SizedBox();
      }
    }

    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        mainAxisAlignment: chatMessage.isSender
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (!chatMessage.isSender) ...[
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("assets/images/user_2.png"),
            )
          ],
          SizedBox(
            width: kDefaultPadding / 2,
          ),
          messageContaint(chatMessage),
          if (chatMessage.isSender)
            MessageStatusDot(
              status: chatMessage.messageStatus,
            ),
        ],
      ),
    );
  }
}
