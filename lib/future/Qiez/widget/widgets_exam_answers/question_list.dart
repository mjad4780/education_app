import 'package:education/core/helpers/spacing.dart';
import 'package:education/future/Qiez/cubit/exam_cubit.dart';
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
          itemBuilder: (context, index) => QuestionCard(
                model: context
                    .read<ExamCubit>()
                    .examReport!
                    .data
                    ?.questions?[index],
                index: index,
              ),
          separatorBuilder: (context, index) => const SizedBox(
                height: 5,
              ),
          itemCount:
              context.read<ExamCubit>().examReport!.data!.questions!.length),
    );
  }
}
