import 'package:education/core/helpers/spacing.dart';
import 'package:education/features/qiez/cubit/exam_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'question_card.dart';

class QuestionList extends StatelessWidget {
  const QuestionList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context) * 0.9,
      child: ListView.separated(
          itemBuilder: (context, index) {
            return QuestionCard(
              model: context.read<ExamCubit>().answersData[index],
              index: index,
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 5,
              ),
          itemCount: context.read<ExamCubit>().answersData.length),
    );
  }
}
