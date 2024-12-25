import 'package:education/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/exam_cubit.dart';
import '../../models/exam_questions_model/exam_questions_model.dart';

class SingleChoice extends StatelessWidget {
  final DataQuestions? model;
  final int questionIndex;
  const SingleChoice({super.key, this.model, required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context) / 2.7,
      child: ListView.separated(
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12))),
              child: RadioListTile(
                title: Text(
                  '${model?.options?[index].title}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14),
                ),
                activeColor: const Color(0xff0225FF),
                value: '${model?.options?[index].key}',
                groupValue: context
                    .read<ExamCubit>()
                    .selectedOptionForQuestion(questionIndex),
                onChanged: (val) =>
                    context.read<ExamCubit>().updateOption(questionIndex, val!),
              ),
            ),
          ],
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 8,
        ),
        itemCount: model?.options?.length ?? 0,
      ),
    );
  }
}
