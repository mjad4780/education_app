import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/exam_cubit.dart';
import '../../models/exam_questions_model/exam_questions_model.dart';
import 'multi_choice_question.dart';
import 'single_choice_question.dart';

class PageViewWidget extends StatelessWidget {
  final PageController questionsController;

  final ExamQuestionModel examquestionsData;
  final int? questionIndex;

  const PageViewWidget({
    super.key,
    required this.questionsController,
    required this.examquestionsData,
    required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: questionsController,
        itemCount: examquestionsData.data?.length,
        onPageChanged: (int index) =>
            context.read<ExamCubit>().updateCurrentIndex(index),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 0.5,
                width: double.infinity,
                color: const Color(0xffF0F0F0),
              ),
              const SizedBox(height: 15),
              Container(
                height: 0.5,
                width: 355,
                color: const Color(0xffF0F0F0),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${index + 1} -  ${examquestionsData.data?[index].title}',
                    style: const TextStyle(
                      color: Color(0xff020939),
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Answers',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto',
                    color: Color(0xff9CA3AF),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              examquestionsData.data?[index].multiple != 0
                  ? MultiChoice(
                      model: examquestionsData.data?[index],
                      questionIndex: examquestionsData.data?[index].id ?? 0,
                    )
                  : SingleChoice(
                      model: examquestionsData.data?[index],
                      questionIndex: examquestionsData.data?[index].id ?? 0,
                    ),
            ],
          );
        },
      ),
    );
  }
}
