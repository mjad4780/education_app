// import 'package:education/core/helpers/spacing.dart';
// import 'package:education/future/course%20detaias/data/models/detailashome/video.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../cubit/video_course_cubit.dart';
// import 'title_video_detailas.dart';

// class CustomCurriculum extends StatelessWidget {
//   const CustomCurriculum({super.key, required this.videos});
//   final List<Video> videos;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: !context.read<VideoCourseCubit>().headCourse!.isFree!
//           ? height(context) / 3.3
//           : height(context) / 2.65,
//       child: BlocConsumer<VideoCourseCubit, VideoCourseState>(
//         listener: (context, state) {
//           if (state is PlayFailure) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                   content: Text('خطأ أثناء تحميل الملف: ${state.message}')),
//             );
//           }
//         },
//         builder: (context, state) {
//           return ListView.builder(
//             itemCount: videos.length, // عدد الأقسام
//             itemBuilder: (context, index) {
//               var cubit = context.read<VideoCourseCubit>();
//               return Column(
//                 children: [
//                   TitleVideoDetailas(
//                     free: videos[index].isFree ?? false,
//                     isfillexit: cubit.isfillgStatus(videos[index].title!),
//                     value: videos[index],
//                     isDownloading:
//                         cubit.isFileDownloading(videos[index].title!),
//                     progress: cubit.progressdouble,
//                   ),
//                   const Divider(),
//                 ],
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
