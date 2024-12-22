//exam questions

import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../models/exam_overview_model/examOverViewModel.dart';
import '../bloc/cubit.dart';
import '../bloc/states.dart';
import '../widgets/custom_bottom_sheet.dart';
import '../widgets/custom_question_progress.dart';
import '../widgets/exam_buttons.dart';
import '../widgets/page_view_widget.dart';

class ExamQuestionsPage extends StatelessWidget {
  const ExamQuestionsPage(
      {super.key, required this.exams, this.model, this.questionIndex});

  final ExamsOverview exams;
  final int? questionIndex;
  final Data? model;
  static var questionsController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => ExamsCubit()
          ..getExamQuestions(id: exams.id)
          ..getExamOverview(),
        child: BlocConsumer<ExamsCubit, ExamQuestionStats>(
            listener: (BuildContext context, Object? state) {},
            builder: (BuildContext context, state) {
              if (state is ExamQuestionsLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              final cubit = ExamsCubit.get(context);

              // secondsRemaining = exams.examTime;
              // print(cubit.examOverviewData?.data?.exams);
              // Track the number of answered questions
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
                    // actions: actionsOfExam(context, controller, cubit, idString,
                    //     exams, examquestionsData, questionsController),
                  ),
                  body: Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 24, end: 24),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        // TimerExam(
                        //   controller: controller,
                        //   idString: exams.id ?? 0,
                        //   secondsRemaining: exams.examTime ?? 0,
                        // ),
                        const SizedBox(
                          height: 15,
                        ),
                        QuestionProgress(
                          questionNumbers: context
                              .read<ExamsCubit>()
                              .examquestionsData
                              .data!
                              .length,
                          index: context
                                      .read<ExamsCubit>()
                                      .examquestionsData
                                      .data ==
                                  null
                              ? questionIndex!
                              : cubit.currentIndex + 1,
                        ),
                        PageViewWidget(
                          questionsController: questionsController,
                          questionIndex: questionIndex ?? 0,
                          examquestionsData:
                              context.read<ExamsCubit>().examquestionsData,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ExamButtons(
                          questionsController: questionsController,
                          examquestionsData:
                              context.read<ExamsCubit>().examquestionsData,
                          cubit: context.read<ExamsCubit>(),
                          idString: exams.id.toString(),
                        ),
                        Builder(builder: (context) {
                          return GestureDetector(
                              onTap: () {
                                showAddForm(
                                    context, exams, questionsController);
                              },
                              child: const Center(child: Text('data')));
                        }),

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
  var value = context.read<ExamsCubit>();

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
