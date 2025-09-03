import 'package:education/core/Router/route_string.dart';
import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/future/course%20detaias/cubit/video_course_cubit.dart';
import 'package:education/future/course%20detaias/data/models/detailashome/detailas_home.dart';
import 'package:education/future/course%20detaias/widget/title_video_detailas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_buttom_detalias_vIdeo_and_exam.dart';
import 'custom_list_filles.dart';

class ButtomVideoAndPdfAndExams extends StatelessWidget {
  const ButtomVideoAndPdfAndExams({
    super.key,
    required this.detailasCourse,
  });
  final DetailasCourse detailasCourse;

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
                  ? CustomCurriculum(
                      videos: detailasCourse.videos!,
                    )
                  : context.read<VideoCourseCubit>().rebuildCourse == 1
                      ? CustomListFilles(
                          filles: detailasCourse.filles ?? [],
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
