import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../../../core/Router/route_string.dart';
import '../../cubit/exam_cubit.dart';

class TimerExam extends StatelessWidget {
  const TimerExam(
      {super.key, required this.idString, required this.secondsRemaining});
  final int idString, secondsRemaining;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: BlocBuilder<ExamCubit, ExamState>(
            builder: (context, state) {
              return Text(
                'QUESTION ${context.read<ExamCubit>().currentIndex + 1} of ${context.read<ExamCubit>().examquestionsData.data!.length}',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  fontFamily: 'Roboto',
                  color: Color(
                    0xff020939,
                  ),
                ),
                textAlign: TextAlign.start,
              );
            },
          ),
        ),
        const Icon(
          Icons.access_alarm,
          color: Color(0xff0225FF),
        ),
        const SizedBox(
          width: 8,
        ),
        Countdown(
          controller: context.read<ExamCubit>().controller,
          onFinished: () {
            // context.read<ExamCubit>().submitStudentAnswers(
            //       idString.toString(),
            //       context.read<ExamCubit>().selectedOptions,
            //     );
            context.pop();

            context.pushReplacementNamed(StringRoute.examReportScreen,
                arguments: context.read<ExamCubit>());
          },
          interval: const Duration(milliseconds: 100),
          seconds: secondsRemaining * 60,
          build: (BuildContext context, double time) {
            Duration duration = Duration(seconds: time.toInt());

            String hours = duration.inHours.toString().padLeft(2, '0');
            String minutes =
                (duration.inMinutes.remainder(60)).toString().padLeft(2, '0');
            String seconds =
                (duration.inSeconds.remainder(60)).toString().padLeft(2, '0');
            return Text(
              '$hours:$minutes:$seconds',
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                fontFamily: 'Roboto',
                color: Color(
                  0xff020939,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
