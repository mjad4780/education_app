import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../exam_questions/view/exam_questions.dart';
import '../../models/exam_overview_model/examOverViewModel.dart';
import '../bloc/cubit.dart';
import '../bloc/states.dart';

// ignore: must_be_immutable
class CustomBottomButton extends StatelessWidget {
  CustomBottomButton(
      {super.key, required this.bottomTitle, required this.exams});

  String bottomTitle;
  ExamsOverview? exams;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExamsCubit, ExamsOverviewStats>(
        listener: (context, state) {},
        builder: (context, state) {
          // var cubit = ExamsCubit.get(context).examOverviewData;
          return Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(top: 20, bottom: 20),
              child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExamQuestionsPage(
                                exams: exams!,
                              )),
                    );
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 56,
                      width: 327,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Color(0xff0225FF)),
                      child: Text(
                        bottomTitle,
                        style: const TextStyle(color: Colors.white),
                      ))),
            ),
          );
        });
  }
}
