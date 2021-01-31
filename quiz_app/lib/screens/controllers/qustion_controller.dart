import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/models/Questions.dart';
import 'package:quiz_app/screens/quiz_screen/components/qustion_card.dart';

// import 'package:flutter/animation.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  AnimationController _animationController;
  Animation _animation;

  Animation get animation => this._animation;

  List<Question> _qusestion = sample_data
      .map((qustion) => Question(
          id: qustion['id'],
          question: qustion['question'],
          options: qustion['options'],
          answer: qustion['answer_index']))
      .toList();

  List<Question> get qusttions => this._qusestion;

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: Duration(seconds: 10), vsync: this);

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });

    _animationController.forward();
    super.onInit();
  }
}
