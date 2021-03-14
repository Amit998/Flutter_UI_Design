import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:messaging_app_light_and_dark/components/filled_outline_button.dart';
import 'package:messaging_app_light_and_dark/constants.dart';
import 'package:messaging_app_light_and_dark/models/Chat.dart';
import 'package:messaging_app_light_and_dark/screens/chats/components/chat_card.dart';
import 'package:messaging_app_light_and_dark/screens/messages/messages.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: kPrimaryColor,
          padding: EdgeInsets.fromLTRB(
              kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
          child: Row(
            children: [
              FillOutlineButton(press: () {}, text: "Recent Message"),
              SizedBox(width: kDefaultPadding),
              FillOutlineButton(
                press: () {},
                text: "Recent Message",
                isFilled: false,
              )
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: (context, index) => ChatCard(
              chat: chatsData[index],
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MessageScreen()));
              },
            ),
          ),
        )
      ],
    );
  }
}
