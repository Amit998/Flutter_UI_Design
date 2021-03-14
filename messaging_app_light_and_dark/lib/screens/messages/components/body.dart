import 'package:flutter/material.dart';
import 'package:messaging_app_light_and_dark/constants.dart';

import 'chat_input_field.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        ChatInputField(),
      ],
    );
  }
}
