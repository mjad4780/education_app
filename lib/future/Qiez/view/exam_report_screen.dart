//report exam
import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/future/Qiez/cubit/exam_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/Router/route_string.dart';
import '../constants.dart';

import '../widget/widgets_exam_answers/custom_answers_cards.dart';
import '../widget/custom_exam_report_header.dart';
import '../widget/custom_score_circle.dart';
import '../widget/custome_app_bar.dart';

class ExamReportScreen extends StatelessWidget {
  final ExamCubit examCubit;

  const ExamReportScreen({super.key, required this.examCubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: examCubit,
        child: BlocConsumer<ExamCubit, ExamState>(
          listener: (context, state) {},
          builder: (context, state) {
            // var cubit = ExamReportCubit.get(context);
            return Scaffold(
              appBar: appBarCustom(
                pageName: "Exam Report",
                context: context,
              ),
              floatingActionButton: SizedBox(
                width: 150,
                child: FloatingActionButton(
                  backgroundColor: mainColor,
                  onPressed: () {
                    context.pushName(StringRoute.examAnswers,
                        arguments: examCubit);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Exam Report",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      )),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              body: context.read<ExamCubit>().examReport != null
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          ReportHeader(
                            score: context
                                    .read<ExamCubit>()
                                    .examReport!
                                    .data!
                                    .score ??
                                0,
                            message: context
                                    .read<ExamCubit>()
                                    .examReport!
                                    .data!
                                    .message ??
                                '',
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Text(
                            "Your Score",
                            style: TextStyle(color: iconColor),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ScoreCircle(
                            score: context
                                    .read<ExamCubit>()
                                    .examReport!
                                    .data!
                                    .score ??
                                0,
                            questionNumbers: context
                                    .read<ExamCubit>()
                                    .examReport
                                    ?.data
                                    ?.questions
                                    ?.length ??
                                0,
                            iscorrect: context
                                    .read<ExamCubit>()
                                    .examReport!
                                    .data!
                                    .correctAnswersCount ??
                                0,
                          ),
                          AnswersCards(
                            questionNumbers: context
                                    .read<ExamCubit>()
                                    .examReport
                                    ?.data
                                    ?.questions
                                    ?.length ??
                                0,
                          ),
                          const SizedBox(
                            height: 16,
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
        ));
  }
}
