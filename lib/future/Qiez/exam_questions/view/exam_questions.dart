//exam questions

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../constants.dart';
import '../../exam_report/view/exam_report_screen.dart';
import '../../models/exam_overview_model/examOverViewModel.dart';
import '../bloc/cubit.dart';
import '../bloc/states.dart';
import '../widgets/actions_of_exam.dart';
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
    int? secondsRemaining;
    final CountdownController controller = CountdownController(autoStart: true);

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
          final examquestionsData = cubit.examquestionsData;
          secondsRemaining = exams.examTime;
          // print(cubit.examOverviewData?.data?.exams);
          final idString =
              exams.id.toString(); // Track the number of answered questions
          return Scaffold(
            appBar: AppBar(
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
              actions: actionsOfExam(context, controller, cubit, idString,
                  exams, examquestionsData, questionsController),
            ),
            body: ExamsCubit.get(context).examquestionsData != null &&
                    ExamsCubit.get(context).examOverviewData != null
                ? Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 24, end: 24),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: BlocBuilder<ExamsCubit, ExamQuestionStats>(
                                builder: (context, state) {
                                  return Text(
                                    'QUESTION ${cubit.currentIndex + 1} of ${examquestionsData?.data?.length}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      fontFamily: 'Roboto',
                                      color: Color(
                                        0xff020939,
                                      ),
                                    ),
                                    textAlign: TextAlign.start,
                                  );
                                },
                              ),
                            ),
                            const Icon(
                              Icons.access_alarm,
                              color: Color(0xff0225FF),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Countdown(
                              controller: controller,
                              onFinished: () {
                                cubit.submitStudentAnswers(
                                    idString, cubit.selectedOptions,
                                    (responseData) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ExamReportScreen(
                                          responseData: responseData),
                                    ),
                                  );
                                });
                                print('timer is done');
                              },
                              interval: const Duration(milliseconds: 100),
                              seconds: secondsRemaining! * 60,
                              build: (BuildContext context, double time) {
                                // Convert the time to a Duration object
                                Duration duration =
                                    Duration(seconds: time.toInt());

                                // Format the duration to display hours, minutes, and seconds
                                String hours =
                                    duration.inHours.toString().padLeft(2, '0');
                                String minutes =
                                    (duration.inMinutes.remainder(60))
                                        .toString()
                                        .padLeft(2, '0');
                                String seconds =
                                    (duration.inSeconds.remainder(60))
                                        .toString()
                                        .padLeft(2, '0');
                                // Return the formatted time as text
                                return Text(
                                  '$hours:$minutes:$seconds',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    color: Color(
                                      0xff020939,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        QuestionProgress(
                          question_numbers:
                              examquestionsData?.data?.length ?? 0,
                          index: model != null
                              ? questionIndex!
                              : cubit.currentIndex + 1,
                        ),
                        PageViewWidget(
                          questionsController: questionsController,
                          questionIndex: questionIndex,
                          examquestionsData: examquestionsData,
                          cubit: cubit,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ExamButtons(
                          questionsController: questionsController,
                          examquestionsData: examquestionsData,
                          cubit: cubit,
                          idString: idString,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(
                      color: mainColor,
                    ),
                  ),
          );
        },
      ),
    );
  }
}
