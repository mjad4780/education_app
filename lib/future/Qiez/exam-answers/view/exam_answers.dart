import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../exam_report/bloc/cubit.dart';
import '../../exam_report/bloc/state.dart';
import '../widgets/question_list.dart';

class ExamAnswers extends StatelessWidget {
  const ExamAnswers({super.key, required this.responseData});
  final Map<String, dynamic> responseData;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          ExamReportCubit()..getExamReport(responseData: responseData),
      child: BlocConsumer<ExamReportCubit, ExamReportStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          return Scaffold(
            backgroundColor: Colors.white,
            // appBar:appBarCustom(pageName: "Exam Answers", context: context),
            body: ExamReportCubit.get(context).examReport != null
                ? Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${ExamReportCubit.get(context).examReport?.data?.title}',
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
                      ),
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(
                    color: mainColor,
                  )),
          );
        },
      ),
    );
  }
}
