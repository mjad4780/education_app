import 'package:education/core/Router/route_string.dart';
import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/future/course%20detaias/cubit/video_course_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_about_mentor.dart';
import 'custom_curriculcum.dart';

class ButtomVideoAndPdfAndExams extends StatelessWidget {
  const ButtomVideoAndPdfAndExams({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<VideoCourseCubit, VideoCourseState, int>(
        selector: (state) => state is WatchRebuild ? state.buttomrebuild : 0,
        builder: (context, state) {
          return Column(
            children: [
              const Row(
                children: [
                  Spacer(),
                  CustomButtomDetaliasVIdeoAndExam(title: "Video", index: 0),
                  Spacer(),
                  CustomButtomDetaliasVIdeoAndExam(
                    title: "Filles",
                    index: 1,
                  ),
                  Spacer(),
                  CustomButtomDetaliasVIdeoAndExam(
                    title: "Exams",
                    index: 2,
                  ),
                  Spacer(),
                ],
              ),
              state == 0
                  ? const CustomCurriculum()
                  : state == 1
                      ? const CustomAboutMentor(
                          value: null,
                          isDownloading: null,
                          progress: null,
                          extension: '',
                          isfillexit: null,
                        )
                      : ListTile(
                          onTap: () =>
                              context.pushName(StringRoute.examOverviewPage),
                          title: const Text('Exams'),
                          trailing: const Icon(Icons.quiz_outlined),
                        )
            ],
          );
        });
  }
}

class CustomButtomDetaliasVIdeoAndExam extends StatelessWidget {
  const CustomButtomDetaliasVIdeoAndExam({
    super.key,
    required this.index,
    required this.title,
  });

  final int index;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<VideoCourseCubit, VideoCourseState, int>(
      selector: (state) => state is WatchRebuild ? state.buttomrebuild : 0,
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<VideoCourseCubit>().watchcourse(index);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            // margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            constraints: const BoxConstraints(minHeight: 55, minWidth: 70),
            alignment: Alignment.center, // جعل المحتوى في المنتصف
            decoration: BoxDecoration(
                color: state == index
                    ? context.color.teal
                    : const Color(0xFFE8F1FF),
                borderRadius: BorderRadius.circular(16)),
            child: Text(title,
                textAlign: TextAlign.center,
                style: context.textStyle.displaySmall!.copyWith(
                    color: state == index
                        ? const Color(0xFFE8F1FF)
                        : context.color.black,
                    fontWeight: FontWeight.w700)),
          ),
        );
      },
    );
  }
}
