import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/spacing.dart';
import '../cubit/video_course_cubit.dart';
import 'custom_detailas_filles.dart';

class CustomListFilles extends StatelessWidget {
  const CustomListFilles({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height(context) * 0.3,
        child: BlocConsumer<VideoCourseCubit, VideoCourseState>(
            listener: (context, state) {
          if (state is PlayPdfFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text('خطأ أثناء تحميل الملف: ${state.message}')),
            );
          }
        }, builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children:
                  context.read<VideoCourseCubit>().responsepdf.map((value) {
                return CustomDetailasFilles(
                  isfillexit: context
                      .read<VideoCourseCubit>()
                      .isfillgStatuspdf(value.title),
                  value: value,
                  isDownloading: context
                      .read<VideoCourseCubit>()
                      .isFileDownloadingpdf(value.title),
                );
              }).toList(),
            ),
          );
        }));
  }
}
