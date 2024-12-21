import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../exam_report/widgets/custome_app_bar.dart';
import '../../models/exam_overview_model/examOverViewModel.dart';
import '../bloc/cubit.dart';
import '../bloc/states.dart';
import '../widgets/custom_bottom_button.dart';
import '../widgets/custom_details_card.dart';
import '../widgets/custom_line.dart';

// ignore: must_be_immutable
class ExamOverviewPage extends StatelessWidget {
  ExamsOverview? exams;

  ExamOverviewPage({super.key, required this.exams});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExamsCubit()..getExamOverview(id: exams?.id),
      child: BlocConsumer<ExamsCubit, ExamsOverviewStats>(
        listener: (context, state) {},
        builder: (context, state) {
          // var cubit = ExamsCubit.get(context).examOverviewData;
          return Scaffold(
            appBar: exams?.title != null
                ? appBarCustom(pageName: "${exams?.title}", context: context)
                : appBarCustom(pageName: "", context: context),
            body: exams != null
                ? Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 24, end: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        const CustomLine(),
                        const SizedBox(height: 24),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${exams?.title}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff020939),
                                  fontSize: 20),
                            ),
                            (exams?.description != '')
                                ? const SizedBox(height: 20)
                                : const SizedBox(),
                            Text(
                              '${exams?.description}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff4B5563),
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            CustomDetailsCard(
                                questionsCount: exams?.questionsCount,
                                title: "Questions",
                                iconName: Icons.description_outlined),
                            const SizedBox(width: 16),
                            CustomDetailsCard(
                              title: "Min score",
                              iconName: Icons.gpp_good_outlined,
                              minScore: exams?.minScore,
                            ),
                          ],
                        ),
                        const Spacer(flex: 1),
                        const Row(children: [
                          Text(
                            " Your grade",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff020939)),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Text("---")
                        ]),
                        CustomBottomButton(
                            exams: exams, bottomTitle: "Start Exam")
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
