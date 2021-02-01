import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screens/controllers/qustion_controller.dart';
import 'package:quiz_app/screens/quiz_screen/components/body.dart';
import 'package:websafe_svg/websafe_svg.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          FlatButton(
            onPressed: _controller.nextQuestion,
            child: Text("Skip"),
          ),
        ],
      ),
      body: Body(),
    );
  }
}
