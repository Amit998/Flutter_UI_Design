import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/models/Questions.dart';
import 'package:quiz_app/screens/quiz_screen/components/qustion_card.dart';
import 'package:quiz_app/screens/score/score_screen.dart';

// import 'package:flutter/animation.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  AnimationController _animationController;
  Animation _animation;

  Animation get animation => this._animation;

  PageController _pageController;
  PageController get pageController => this._pageController;

  List<Question> _qusestion = sample_data
      .map((qustion) => Question(
          id: qustion['id'],
          question: qustion['question'],
          options: qustion['options'],
          answer: qustion['answer_index']))
      .toList();

  List<Question> get qusttions => this._qusestion;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int _correctAns;
  int get correctAns => this._correctAns;

  int _selecetedAns;
  int get selectedAnd => this._selecetedAns;

  RxInt _qustionNumber = 1.obs;
  RxInt get questionNumber => this._qustionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });

    _animationController.forward();

    _pageController = PageController();

    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selecetdIndex) {
    // print(selecetdIndex);
    // print(question.answer);
    print(numOfCorrectAns);
    _isAnswered = true;

    _correctAns = question.answer;
    _selecetedAns = selecetdIndex;

    if (_correctAns == _selecetedAns) {
      _numOfCorrectAns = _numOfCorrectAns + 1;
    }
    ;

    _animationController.stop();
    update();

    Future.delayed(Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_qustionNumber.value != _qusestion.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);

      _animationController.reset();

      _animationController.forward().whenComplete(nextQuestion);
    } else {
      Get.to(ScoreScreen());
    }
  }

  void updateTheNum(int index) {
    _qustionNumber.value = index + 1;
  }
}
