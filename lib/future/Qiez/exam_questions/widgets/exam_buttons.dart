import 'package:flutter/material.dart';

import '../../exam_report/view/exam_report_screen.dart';

class ExamButtons extends StatelessWidget {
  final questionsController;

  final examquestionsData;

  final cubit;
  final idString;

  const ExamButtons(
      {super.key,
      required this.questionsController,
      required this.examquestionsData,
      required this.cubit,
      required this.idString});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            questionsController.previousPage(
              duration: const Duration(milliseconds: 750),
              curve: Curves.fastLinearToSlowEaseIn,
            );
          },
          child: Container(
            height: 44,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              // Adjust padding here
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Icon(
                      Icons.arrow_back,
                      color: Color(0xff0225FF),
                      size: 24,
                    ),
                  ),
                  Text(
                    'Previous',
                    style: TextStyle(
                      color: Color(0xff0225FF),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Spacer(flex: 1),
        InkWell(
          onTap: () {
            if (examquestionsData?.data?.length != null &&
                cubit.currentIndex !=
                    (examquestionsData?.data?.length ?? 0) - 1) {
              // Navigate to the next page
              questionsController.nextPage(
                duration: const Duration(milliseconds: 750),
                curve: Curves.fastOutSlowIn,
              );
            } else {
              // Submit answers and navigate to the ExamReportScreen
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Exam End'),
                ),
              );
              cubit.submitStudentAnswers(
                idString!,
                cubit.selectedOptions,
                (responseData) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExamReportScreen(
                        responseData: responseData,
                      ),
                    ),
                  );
                },
              );
            }
          },
          child: Container(
            height: 44,
            width: 108,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xff0225FF),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    examquestionsData?.data?.length != null &&
                            cubit.currentIndex !=
                                (examquestionsData?.data?.length ?? 0) - 1
                        ? 'Next'
                        : 'Submit',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child:
                      Icon(Icons.arrow_forward, color: Colors.white, size: 24),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
