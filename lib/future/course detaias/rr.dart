// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:path_provider/path_provider.dart';

// import '../../core/service/video_hundle/video_service.dart';
// import 'cubit/video_course_cubit.dart';
// import 'data/repo/repo_video.dart';

// class FileHandler extends StatelessWidget {
//   const FileHandler({super.key});
//   static final files = [
//     {
//       'url':
//           'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
//       'name': 'video.mp4'
//     },
//     {
//       'url':
//           'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
//       'name': 'document.pdf'
//     },
//     {'url': 'https://example.com/image.png', 'name': 'image.png'},
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => VideoCourseCubit(RepoVideo(VideoService(Dio()))),
//       child: BlocConsumer<VideoCourseCubit, VideoCourseState>(
//         listener: (context, state) => _listenerState(state, context),
//         builder: (context, state) {
//           final cubit = context.read<VideoCourseCubit>();

//           return Scaffold(
//             appBar: AppBar(title: const Text('إدارة الملفات')),
//             body: SizedBox(
//               height: 500,
//               child: ListView.builder(
//                 itemCount: files.length,
//                 itemBuilder: (context, index) {
//                   return FileItem(
//                     file: files[index],
//                     // fileExists: cubit.fileExist(file['name']!),
//                     isDownloading: cubit.isDownloading,
//                     progress: cubit.progressdouble,
//                     onDownload: (url, name, context) {
//                       cubit.play(url, name);
//                     },
//                   );
//                 },
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   void _listenerState(VideoCourseState state, BuildContext context) {
//     if (state is PlaySuccess) {
//       final fileType = state.successString.$1;
//       final filePath = state.successString.$2;

//       if (fileType == 'video') {
//         // Navigator.push(
//         //   context,
//         //   MaterialPageRoute(
//         //     builder: (context) => VideoPlayerScreen(videoPath: filePath!),
//         //   ),
//         // );
//       } else if (fileType == 'pdf') {
//         // Navigator.push(
//         //   context,
//         //   MaterialPageRoute(
//         //     builder: (context) => PdfViewerScreen(pdfPath: filePath!),
//         //   ),
//         // );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('نوع الملف غير مدعوم: $fileType')),
//         );
//       }
//     } else if (state is PlayFailure) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('خطأ أثناء تحميل الملف: ${state.message}')),
//       );
//     } else if (state is PlayLoading) {
//       // التعامل مع التحميل هنا
//     }
//   }
// }

// class FileItem extends StatefulWidget {
//   final Map<String, String> file;
//   final bool isDownloading;
//   final double progress;

//   final Function(String, String, BuildContext) onDownload;

//   const FileItem({
//     required this.file,
//     required this.isDownloading,
//     required this.progress,
//     required this.onDownload,
//     super.key,
//   });

//   @override
//   State<FileItem> createState() => _FileItemState();
// }

// class _FileItemState extends State<FileItem> {
//   bool fileExists = false;
//   fileExist(String fileName) async {
//     final directory = await getApplicationDocumentsDirectory();
//     final filePath = '${directory.path}/$fileName';

//     setState(() {
//       fileExists = File(filePath).existsSync();
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     fileExist((widget.file['name'] ?? ''));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 5,
//       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//       shadowColor: Colors.grey.shade300,
//       child: ListTile(
//         title: Text(widget.file['name']!),
//         leading: fileExists
//             ? const Icon(Icons.check_circle, color: Colors.green)
//             : const Icon(Icons.insert_drive_file, color: Colors.grey),
//         trailing: widget.isDownloading
//             ? Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   CircularProgressIndicator(
//                     value: widget.progress,
//                     strokeWidth: 2.5,
//                     backgroundColor: Colors.grey.shade200,
//                     valueColor:
//                         const AlwaysStoppedAnimation<Color>(Colors.blue),
//                   ),
//                   Text(
//                     '${(widget.progress * 100).toStringAsFixed(1)}%',
//                     style: const TextStyle(fontSize: 12, color: Colors.blue),
//                   ),
//                 ],
//               )
//             : IconButton(
//                 icon: fileExists
//                     ? const Icon(Icons.save_alt, color: Colors.green)
//                     : const Icon(Icons.download),
//                 onPressed: () => widget.onDownload(
//                     widget.file['url']!, widget.file['name']!, context),
//               ),
//       ),
//     );
//   }
// }
