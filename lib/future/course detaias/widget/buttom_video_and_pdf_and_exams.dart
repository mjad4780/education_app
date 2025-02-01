import 'package:education/core/Router/route_string.dart';
import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/future/course%20detaias/cubit/video_course_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_buttom_detalias_vIdeo_and_exam.dart';
import 'custom_curriculcum.dart';
import 'custom_list_filles.dart';

class ButtomVideoAndPdfAndExams extends StatelessWidget {
  const ButtomVideoAndPdfAndExams({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoCourseCubit, VideoCourseState>(
        buildWhen: (previous, current) => current is WatchRebuild,
        // selector: (state) => state is WatchRebuild
        //     ? state.buttomrebuild
        //     : context.read<VideoCourseCubit>().rebuildCourse,
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
              // detaliasWidget(context, context.read<VideoCourseCubit>())
              context.read<VideoCourseCubit>().rebuildCourse == 0
                  ? const CustomCurriculum()
                  : context.read<VideoCourseCubit>().rebuildCourse == 1
                      ? const CustomListFilles()
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
