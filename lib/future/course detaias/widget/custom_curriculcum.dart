import 'package:education/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/video_course_cubit.dart';
import 'title_video_detailas.dart';

class CustomCurriculum extends StatelessWidget {
  const CustomCurriculum({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: !context.read<VideoCourseCubit>().headCourse!.isFree!
          ? height(context) / 3.3
          : height(context) / 2.65,
      child: BlocConsumer<VideoCourseCubit, VideoCourseState>(
        listener: (context, state) {
          if (state is PlayFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text('خطأ أثناء تحميل الملف: ${state.message}')),
            );
          }
        },
        builder: (context, state) {
          return ListView.builder(
            itemCount: context
                .read<VideoCourseCubit>()
                .fillterCourse!
                .videos!
                .length, // عدد الأقسام
            itemBuilder: (context, index) {
              var cubit = context.read<VideoCourseCubit>();
              return Column(
                children: [
                  TitleVideoDetailas(
                    free: cubit.fillterCourse!.videos![index].isFree!,
                    isfillexit: cubit.isfillgStatus(
                        cubit.fillterCourse!.videos![index].title!),
                    value: cubit.fillterCourse!.videos![index],
                    isDownloading: cubit.isFileDownloading(
                        cubit.fillterCourse!.videos![index].title!),
                    progress: cubit.progressdouble,
                  ),
                  const Divider(),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
