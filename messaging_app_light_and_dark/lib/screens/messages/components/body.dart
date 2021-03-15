import 'package:flutter/material.dart';
import 'package:messaging_app_light_and_dark/constants.dart';
import 'package:messaging_app_light_and_dark/models/ChatMessage.dart';
import 'package:messaging_app_light_and_dark/screens/messages/components/message.dart';
import 'package:messaging_app_light_and_dark/screens/messages/components/text_messages.dart';
import '../../../models/ChatMessage.dart';

import 'chat_input_field.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Spacer(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ListView.builder(
              itemCount: demoChatMessages.length,
              itemBuilder: (context, index) => Message(
                chatMessage: demoChatMessages[index],
              ),
            ),
          ),
        ),
        ChatInputField(),
      ],
    );
  }
}
