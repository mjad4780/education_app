import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

import '../../../../widget/app_text_button.dart';
import '../../constants.dart';
import '../../exam_report/view/exam_report_screen.dart';
import '../../models/exam_overview_model/examOverViewModel.dart';

import '../widgets/custom_details_card.dart';

// ignore: must_be_immutable
class ExamOverviewPage extends StatelessWidget {
  final ExamsOverview exams;

  const ExamOverviewPage({super.key, required this.exams});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: context.color.greyLight,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: iconBackgroundColor,
              radius: 14,
              child: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 20,
                ),
                color: mainColor,
              ),
            ),
          ),
          title: Text(
            exams.title ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsetsDirectional.only(start: 24, end: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Container(
                height: 0.5,
                width: double.infinity,
                color: Colors.grey.withOpacity(0.4),
              ),
              const SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${exams.title}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xff020939),
                        fontSize: 20),
                  ),
                  (exams.description != '')
                      ? const SizedBox(height: 20)
                      : const SizedBox(),
                  Text(
                    '${exams.description}',
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
                      questionsCount: exams.questionsCount,
                      title: "Questions",
                      iconName: Icons.description_outlined),
                  const SizedBox(width: 16),
                  CustomDetailsCard(
                    title: "Min score",
                    iconName: Icons.gpp_good_outlined,
                    minScore: exams.minScore,
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
              verticalSpace(3),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppTextButton(
                  buttonText: 'Start Exam',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ExamReportScreen(
                            responseData: {},
                          ),
                        ));

                    // context.pushName(StringRoute.examQuestionsPage,
                    //     arguments: exams);
                  },
                ),
              )
            ],
          ),
        ));
  }
}
