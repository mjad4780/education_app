//question progress
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../constants.dart';

class QuestionProgress extends StatelessWidget {
  final int index;
  final int questionNumbers;
  const QuestionProgress(
      {super.key, required this.index, required this.questionNumbers});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: LinearPercentIndicator(
        lineHeight: 3.0,
        percent: index / questionNumbers, //100 is number of questions
        backgroundColor: Colors.grey,
        progressColor: mainColor,
      ),
    );
  }
}
