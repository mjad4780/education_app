import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../constants.dart';
import '../../models/exam_questions_model/exam_questions_model.dart';
import '../bloc/cubit.dart';

class MultiChoice extends StatelessWidget {
  final DataQuestions? model;
  final int questionIndex;

  const MultiChoice({super.key, this.model, required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context) / 2.7,
      child: ListView.separated(
        itemBuilder: (context, index) => Column(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  child: CheckboxListTile(
                    title: Text(
                      '${model?.options?[index].title}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: mainColor,
                    value:
                        cc(context, questionIndex, model?.options?[index].key),
                    onChanged: (val) => context
                        .read<ExamsCubit>()
                        .updateMultiOption(
                            questionIndex, model?.options?[index].key ?? ''),
                  ),
                ),
              ],
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

bool cc(BuildContext context, int questionIndex, String? key) {
  String selectedOptions =
      context.read<ExamsCubit>().selectedOptionsForQuestion(questionIndex) ??
          '';
  return selectedOptions.contains(key ?? '');
}
