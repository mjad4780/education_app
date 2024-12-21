//report exam
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../exam-answers/view/exam_answers.dart';

import '../bloc/cubit.dart';
import '../bloc/state.dart';
import '../widgets/custom_answers_cards.dart';
import '../widgets/custom_examReport_header.dart';
import '../widgets/custom_score_circle.dart';
import '../widgets/custome_app_bar.dart';

class ExamReportScreen extends StatelessWidget {
  final Map<String, dynamic> responseData;

  const ExamReportScreen({super.key, required this.responseData});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          ExamReportCubit()..getExamReport(responseData: responseData),
      child: BlocConsumer<ExamReportCubit, ExamReportStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ExamReportCubit.get(context);
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExamAnswers(
                        responseData: responseData,
                      ),
                    ),
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Exam Report",
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            body: cubit.examReport != null
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        ReportHeader(
                          score: cubit.examReport!.data!.score ?? 0,
                          message: cubit.examReport!.data!.message ?? '',
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
                          score: cubit.examReport!.data!.score ?? 0,
                          question_numbers:
                              cubit.examReport?.data?.questions?.length ?? 0,
                          is_correct:
                              cubit.examReport!.data!.correctAnswersCount ?? 0,
                        ),
                        AnswersCards(
                          question_numbers:
                              cubit.examReport?.data?.questions?.length ?? 0,
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
      ),
    );
  }
}
