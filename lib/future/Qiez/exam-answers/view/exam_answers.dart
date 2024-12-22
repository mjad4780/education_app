import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../exam_report/bloc/cubit.dart';
import '../widgets/question_list.dart';

class ExamAnswers extends StatelessWidget {
  const ExamAnswers({super.key, required this.responseData});
  final Map<String, dynamic> responseData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar:appBarCustom(pageName: "Exam Answers", context: context),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: BlocProvider(
            create: (context) => ExamReportCubit(),
            child: SingleChildScrollView(
              child: Builder(builder: (context) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${context.read<ExamReportCubit>().examReport?.data?.title}',
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
