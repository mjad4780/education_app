import 'package:flutter/material.dart';

import '../../exam_report/bloc/cubit.dart';
import 'question_card.dart';

class QuestionList extends StatelessWidget {
  const QuestionList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 610,
      child: ListView.separated(
          itemBuilder: (context, index) => QuestionCard(
                model: ExamReportCubit.get(context)
                    .examReport!
                    .data
                    ?.questions?[index],
                index: index,
              ),
          separatorBuilder: (context, index) => const SizedBox(
                height: 5,
              ),
          itemCount:
              ExamReportCubit.get(context).examReport!.data!.questions!.length),
    );
  }
}
