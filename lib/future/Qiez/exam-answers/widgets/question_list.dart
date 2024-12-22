import 'package:education/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../exam_report/bloc/cubit.dart';
import 'question_card.dart';

class QuestionList extends StatelessWidget {
  const QuestionList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context) * 0.9,
      child: ListView.separated(
          itemBuilder: (context, index) => QuestionCard(
                model: context
                    .read<ExamReportCubit>()
                    .examReport!
                    .data
                    ?.questions?[index],
                index: index,
              ),
          separatorBuilder: (context, index) => const SizedBox(
                height: 5,
              ),
          itemCount: context
              .read<ExamReportCubit>()
              .examReport!
              .data!
              .questions!
              .length),
    );
  }
}
