//question progress
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../constants.dart';

class QuestionProgress extends StatelessWidget {
  final int index;
  final int question_numbers;
  const QuestionProgress(
      {super.key, required this.index, required this.question_numbers});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: LinearPercentIndicator(
        lineHeight: 3.0,
        percent: index / question_numbers, //100 is number of questions
        backgroundColor: Colors.grey,
        progressColor: mainColor,
      ),
    );
  }
}
