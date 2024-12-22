import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../bloc/cubit.dart';
import '../bloc/states.dart';

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
          child: BlocBuilder<ExamsCubit, ExamQuestionStats>(
            builder: (context, state) {
              return Text(
                'QUESTION ${context.read<ExamsCubit>().currentIndex + 1} of ${context.read<ExamsCubit>().examquestionsData.data!.length}',
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
          controller: context.read<ExamsCubit>().controller,
          onFinished: () {
            context.read<ExamsCubit>().submitStudentAnswers(
                  idString.toString(),
                  context.read<ExamsCubit>().selectedOptions,
                );
            //TODO :push report
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
