import 'package:flutter/material.dart';

import '../../models/exam_questions_model/exam_questions_model.dart';
import '../bloc/cubit.dart';

class SingleChoice extends StatelessWidget {
  final DataQuestions? model;
  final int questionIndex;
  const SingleChoice({super.key, this.model, required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    final cubit = ExamsCubit.get(context);
    return SizedBox(
      height: 320,
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
                groupValue: cubit.selectedOptionForQuestion(questionIndex),
                onChanged: (val) => cubit.updateOption(questionIndex, val!),
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
