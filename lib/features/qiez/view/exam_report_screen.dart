//report exam
import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/features/qiez/cubit/exam_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/Router/route_string.dart';
import '../../../core/style/color_pacgkege_exams.dart';

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
        child: Scaffold(
            appBar: appBarCustom(
              pageName: "Exam Report",
              context: context,
            ),
            floatingActionButton: SizedBox(
              width: 150,
              child: FloatingActionButton(
                backgroundColor: mainColor,
                onPressed: () {
                  // context.read<ExamCubit>().ioo();

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
            body: SingleChildScrollView(
              child: Builder(builder: (context) {
                return Column(
                  children: [
                    ReportHeader(
                      score: context.read<ExamCubit>().score,
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
                        score: context.read<ExamCubit>().score,
                        questionNumbers:
                            context.read<ExamCubit>().answersData.length,
                        iscorrect:
                            context.read<ExamCubit>().correctAnswersCount),
                    AnswersCards(
                        questionNumbers:
                            context.read<ExamCubit>().answersData.length),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                );
              }),
            )));
  }
}
