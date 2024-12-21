import 'package:flutter/material.dart';

import '../../constants.dart';
import '../bloc/cubit.dart';

class AnswersCards extends StatelessWidget {
  final int question_numbers;
  const AnswersCards({super.key, required this.question_numbers});

  @override
  Widget build(BuildContext context) {
    var cubit = ExamReportCubit.get(context);
    var totalQuestions = question_numbers;
    var correctAnswers = cubit.examReport!.data!.correctAnswersCount ?? 0;
    var wrongAnswers = totalQuestions - correctAnswers;

    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 24, end: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: 160,
              // height: 145,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: iconBorder)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 17),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: iconBackgroundColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            Icons.checklist_outlined,
                            color: mainColor,
                            size: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, top: 23, right: 20),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: iconBorder),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: mainColor,
                              size: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 17),
                    child: Text(
                      "${cubit.examReport!.data!.correctAnswersCount ?? 0}",
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 4),
                    child: Text(
                      "Right Answers",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: iconColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Container(
              width: 160,
              // height: 145,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xffF3F4F6))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 17),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: iconBackgroundColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            Icons.line_axis_outlined,
                            color: mainColor,
                            size: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, top: 23, right: 20),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: iconBorder),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: mainColor,
                              size: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 17),
                    child: Text(
                      "$wrongAnswers",
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 4),
                    child: Text(
                      "Wrong Answers",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: iconColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
