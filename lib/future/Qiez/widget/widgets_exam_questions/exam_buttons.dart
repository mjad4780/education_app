import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/Router/route_string.dart';
import '../../cubit/exam_cubit.dart';
import '../../models/exam_questions_model/exam_questions_model.dart';
import '../../models/exam_report_model/exam_report_model.dart';

class ExamButtons extends StatelessWidget {
  final PageController questionsController;

  final ExamQuestionModel examquestionsData;
  final int questionIndex;

  final String idString;

  const ExamButtons(
      {super.key,
      required this.questionsController,
      required this.examquestionsData,
      required this.idString,
      required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            questionsController.previousPage(
              duration: const Duration(milliseconds: 750),
              curve: Curves.fastLinearToSlowEaseIn,
            );
          },
          child: Container(
            height: 44,
            width: width(context) * 0.35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              // Adjust padding here
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Icon(
                      Icons.arrow_back,
                      color: Color(0xff0225FF),
                      size: 24,
                    ),
                  ),
                  Text(
                    'Previous',
                    style: TextStyle(
                      color: Color(0xff0225FF),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Spacer(flex: 1),
        InkWell(
          onTap: () {
            if (examquestionsData.data?.length != null &&
                context.read<ExamCubit>().currentIndex !=
                    (examquestionsData.data?.length ?? 0) - 1) {
              // Navigate to the next page

              if (context.read<ExamCubit>().selectedOption == null) {
                // عرض رسالة خطأ
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('يجب اختيار إجابة للسؤال'),
                    backgroundColor: Colors.red,
                  ),
                );
              } else {
                context.read<ExamCubit>().selectedOption = null;
                questionsController.nextPage(
                  duration: const Duration(milliseconds: 750),
                  curve: Curves.fastOutSlowIn,
                );
              }
            } else {
              // Submit answers and navigate to the ExamReportScreen
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Exam End'),
                ),
              );
              context.read<ExamCubit>().submitStudentAnswers(
                    idString,
                    context.read<ExamCubit>().selectedOptions,
                  );
              context
                  .read<ExamCubit>()
                  .returnAnswersData(examReports.data!.questions!);

              context.pop();

              context.pushReplacementNamed(StringRoute.examReportScreen,
                  arguments: context.read<ExamCubit>());
            }
          },
          child: Container(
            height: 44,
            width: width(context) * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xff0225FF),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    examquestionsData.data?.length != null &&
                            context.read<ExamCubit>().currentIndex !=
                                (examquestionsData.data?.length ?? 0) - 1
                        ? 'Next'
                        : 'Submit',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child:
                      Icon(Icons.arrow_forward, color: Colors.white, size: 24),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
