import 'package:education/future/course%20detaias/data/models/detailashome/fille.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/spacing.dart';
import '../cubit/video_course_cubit.dart';
import 'custom_detailas_filles.dart';

class CustomListFilles extends StatelessWidget {
  const CustomListFilles({super.key, required this.filles});
  final List<Fille> filles;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context) * 0.3,
      child: BlocConsumer<VideoCourseCubit, VideoCourseState>(
        listener: (context, state) {
          if (state is PlayPdfFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('خطأ أثناء تحميل الملف: ${state.message}'),
              ),
            );
          }
        },
        builder: (context, state) {
          if (filles.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Simple rotation animation for empty state
                  TweenAnimationBuilder<double>(
                    duration: const Duration(seconds: 2),
                    tween: Tween(begin: 0.0, end: 2 * 3.14159),
                    builder: (context, value, child) {
                      return Transform.rotate(
                        angle: value,
                        child: const Icon(
                          Icons.folder_open,
                          size: 50,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'لا توجد ملفات متاحة',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: filles.map((value) {
                return CustomDetailasFilles(
                  isfillexit: context
                      .read<VideoCourseCubit>()
                      .isfillgStatuspdf(value.title!),
                  value: value,
                  isDownloading: context
                      .read<VideoCourseCubit>()
                      .isFileDownloadingpdf(value.title!),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
