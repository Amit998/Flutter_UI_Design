import 'package:flutter/material.dart';
import 'package:messaging_app_light_and_dark/models/Chat.dart';

import '../../../constants.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key key,
    @required this.chat,
    @required this.press,
  }) : super(key: key);
  final VoidCallback press;

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding * 0.8),
        child: Row(
          children: [
            Stack(children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(chat.image),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 3,
                          color: Theme.of(context).scaffoldBackgroundColor),
                      color: chat.isActive ? kPrimaryColor : Colors.grey),
                ),
              )
            ]),
            SizedBox(width: kDefaultPadding * 0.1),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chat.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(
                      height: kDefaultPadding * 0.3,
                    ),
                    Opacity(
                      opacity: 0.8,
                      child: Text(
                        chat.lastMessage,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Opacity(
              opacity: 0.8,
              child: Text(
                chat.time,
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
