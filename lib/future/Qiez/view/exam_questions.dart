//exam questions

import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/style/color_pacgkege_exams.dart';
import '../cubit/exam_cubit.dart';
import '../models/exam_overview_model/examOverViewModel.dart';

import '../widget/widgets_exam_questions/custom_bottom_sheet.dart';
import '../widget/widgets_exam_questions/custom_question_progress.dart';
import '../widget/widgets_exam_questions/exam_buttons.dart';
import '../widget/widgets_exam_questions/page_view_widget.dart';
import '../widget/widgets_exam_questions/timer_exam.dart';

class ExamQuestionsPage extends StatelessWidget {
  const ExamQuestionsPage(
      {super.key, this.questionIndex, required this.examCubit});
  final ExamCubit examCubit;
  final int? questionIndex;
  static var questionsController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: examCubit,
        child: Builder(builder: (context) {
          return Scaffold(
              resizeToAvoidBottomInset: true,
              appBar: AppBar(
                backgroundColor: context.color.greyLight,
                leading: Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                    vertical: 6,
                    horizontal: 9,
                  ),
                  child: CircleAvatar(
                    backgroundColor: iconBackgroundColor,
                    // radius: 14,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 20,
                      ),
                      color: mainColor,
                    ),
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsetsDirectional.only(start: 24, end: 24),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    TimerExam(
                      idString: examCubit.examOverviewData!.data!.id ?? 0,
                      secondsRemaining:
                          examCubit.examquestionsData.data!.length,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    BlocConsumer<ExamCubit, ExamState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return QuestionProgress(
                          questionNumbers: context
                              .read<ExamCubit>()
                              .examquestionsData
                              .data!
                              .length,
                          index: context
                                      .read<ExamCubit>()
                                      .examquestionsData
                                      .data ==
                                  null
                              ? questionIndex!
                              : context.read<ExamCubit>().currentIndex + 1,
                        );
                      },
                    ),
                    PageViewWidget(
                      questionsController: questionsController,
                      questionIndex: questionIndex ?? 0,
                      examquestionsData:
                          context.read<ExamCubit>().examquestionsData,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ExamButtons(
                      questionIndex: questionIndex ?? 0,
                      questionsController: questionsController,
                      examquestionsData:
                          context.read<ExamCubit>().examquestionsData,
                      idString: context
                          .read<ExamCubit>()
                          .examquestionsData
                          .data!
                          .first
                          .id
                          .toString(),
                    ),
                    // Builder(builder: (context) {
                    //   return GestureDetector(
                    //       onTap: () {
                    //         showAddForm(context, exams, questionsController);
                    //       },
                    //       child: const Center(child: Text('data')));
                    // }),

                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ));
        }));
  }
}

void showAddForm(BuildContext context, ExamsOverview exams,
    PageController questionsController) {
  var value = context.read<ExamCubit>();

  showModalBottomSheet(
    // isScrollControlled: true, /////////scorllونعمل
    context: context,
    builder: (BuildContext context) {
      return BlocProvider.value(
          value: value,
          child: CustomBottomSheet(
            data: value.examquestionsData.data,
            exams: exams,
            updatePageViewController: (value) {
              questionsController.animateToPage(
                value,
                duration: const Duration(milliseconds: 500),
                // Optional: Animation duration
                curve: Curves.ease, // Optional: Animation curve
              );
              Navigator.pop(context);
            },
          ));
    },
  );
}
