import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/exam_report_model/exam_report_model.dart';
import 'single_choice.dart';

class QuestionCard extends StatelessWidget {
  final Questions? model;
  final int index;
  const QuestionCard({super.key, this.model, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Question ${index + 1}',
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 14, color: iconColor),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          '${model?.title}',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: mainColor,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Answers',
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 14, color: iconColor),
        ),
        const SizedBox(
          height: 25,
        ),
        // model?.multiple != 0
        // ?
        SingleChoice(model: model)
        // : MultiChoice(model: model),
      ],
    );
  }
}
