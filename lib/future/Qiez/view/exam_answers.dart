import 'package:education/future/Qiez/cubit/exam_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/style/color_pacgkege_exams.dart';
import '../models/exam_report_model/exam_report_model.dart';
import '../widget/widgets_exam_answers/question_list.dart';

class ExamAnswers extends StatelessWidget {
  const ExamAnswers({super.key, required this.examCubit});
  final ExamCubit examCubit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar:appBarCustom(pageName: "Exam Answers", context: context),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: BlocProvider.value(
            value: examCubit,
            child: SingleChildScrollView(
              child: Builder(builder: (context) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${examReports.data?.title}',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: mainColor),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const QuestionList(),
                  ],
                );
              }),
            ),
          ),
        ));
    //   },
    // ),
  }
}
