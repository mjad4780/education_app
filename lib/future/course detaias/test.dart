// import 'dart:developer';
// import 'dart:io';
// import 'package:education/core/get_it/get_it.dart';
// import 'package:education/future/course%20detaias/cubit/video_course_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:video_player/video_player.dart';
// import 'package:path/path.dart' as p;

// class FileHandler extends StatefulWidget {
//   const FileHandler({super.key});

//   @override
//   State<FileHandler> createState() => _FileHandlerState();
// }

// class _FileHandlerState extends State<FileHandler> {
//   // التحقق إذا كان الملف موجودًا محليًا
//   bool dowloading = false;

// // String fileName = "";
//   bool fileExists = false;

//   List<Map<String, String>> files = [
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
//     {'url': 'https://example.com/image.png', 'name': 'image.png'}, // غير مدعوم
//   ];

//   openfile(String? filePath) {
//     OpenFile.open(filePath);
//     print("fff $filePath");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => getIt<VideoCourseCubit>(),
//       child: BlocConsumer<VideoCourseCubit, VideoCourseState>(
//         listener: (context, state) {
//           lisnerState(state, context);
//         },
//         builder: (context, state) {
//           return Scaffold(
//             appBar: AppBar(title: const Text('ملفات الوسائط')),
//             body: ListView.builder(
//               itemCount: files.length,
//               itemBuilder: (context, index) {
//                 final file = files[index];
//                 return GestureDetector(
//                   onTap: () {
//                     log('log');
//                     context
//                         .read<VideoCourseCubit>()
//                         .play(file['url']!, file['name']!);
//                   },
//                   child: Card(
//                     elevation: 10,
//                     shadowColor: Colors.grey.shade100,
//                     child: ListTile(
//                         title: Text(file['name']!),
//                         leading: IconButton(
//                             onPressed: () {
//                               dowloading == false
//                                   ? () {
//                                       log('hgkk');

//                                       context
//                                           .read<VideoCourseCubit>()
//                                           .play(file['url']!, file['name']!);
//                                     }
//                                   : () {
//                                       log('vvvvvvvvvvv');
//                                     };
//                             },
//                             icon: fileExists && dowloading == false
//                                 ? const Icon(
//                                     Icons.window,
//                                     color: Colors.green,
//                                   )
//                                 : const Icon(Icons.close)),
//                         trailing: IconButton(
//                             onPressed: () {
//                               dowloading == false
//                                   ? () {
//                                       log('  gfiufs');
//                                     }
//                                   : () async {
//                                       log('message');
//                                       await context
//                                           .read<VideoCourseCubit>()
//                                           .play(file['url']!, file['name']!);
//                                     };
//                             },
//                             icon: fileExists
//                                 ? const Icon(
//                                     Icons.save,
//                                     color: Colors.green,
//                                   )
//                                 : dowloading
//                                     ? Stack(
//                                         alignment: Alignment.center,
//                                         children: [
//                                           CircularProgressIndicator(
//                                             value: context
//                                                 .read<VideoCourseCubit>()
//                                                 .progressdouble,
//                                             strokeWidth: 3,
//                                             backgroundColor: Colors.grey,
//                                             valueColor:
//                                                 const AlwaysStoppedAnimation<
//                                                     Color>(Colors.blue),
//                                           ),
//                                           Text(
//                                             (context
//                                                         .read<
//                                                             VideoCourseCubit>()
//                                                         .progressdouble *
//                                                     100)
//                                                 .toStringAsFixed(2),
//                                             style:
//                                                 const TextStyle(fontSize: 12),
//                                           )
//                                         ],
//                                       )
//                                     : const Icon(Icons.download))),
//                   ),
//                 );

//                 // GestureDetector(
//                 //   onTap: () {
//                 //     // context
//                 //     //     .read<VideoCourseCubit>()
//                 //     //     .play(file['url']!, file['name']!);
//                 //   },
//                 //   child: ListTile(
//                 //     leading: const Icon(
//                 //         // cont(file['url']!) == 'video'
//                 //         //   ? Icons.videocam
//                 //         //   : determineFileType(file['url']!) == 'pdf'
//                 //         //       ? Icons.picture_as_pdf

//                 //         Icons.error),
//                 //     title: Text(file['name']!),
//                 //     trailing: state is PlayLoading
//                 //         ? const CircularProgressIndicator()
//                 //         : IconButton(
//                 //             icon: const Icon(Icons.download),
//                 //             onPressed: () => context
//                 //                 .read<VideoCourseCubit>()
//                 //                 .play(file['url']!, file['name']!),
//                 //           ),
//                 //   ),
//                 // );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }

//   void lisnerState(VideoCourseState state, BuildContext context) {
//     if (state is PlaySuccess) {
//       dowloading = false;
//       fileExists = true;
//       if (state.successString.$1 == 'video') {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) =>
//                 VideoPlayerScreen(videoPath: state.successString.$2!),
//           ),
//         );
//       } else if (state.successString.$1 == 'pdf') {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) =>
//                 PdfViewerScreen(pdfPath: state.successString.$2!),
//           ),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//               content: Text('نوع الملف غير مدعوم: ${state.successString.$2}')),
//         );
//       }
//     } else if (state is PlayLoading) {
//       dowloading = true;
//       fileExists = false;
//     }
//   }
// }

// class VideoPlayerScreen extends StatefulWidget {
//   final String videoPath;

//   const VideoPlayerScreen({super.key, required this.videoPath});

//   @override
//   State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     if (widget.videoPath.startsWith('http')) {
//       _controller =
//           VideoPlayerController.networkUrl(Uri.parse(widget.videoPath));
//     } else {
//       _controller = VideoPlayerController.file(File(widget.videoPath));
//     }

//     _controller.initialize().then((_) {
//       setState(() {});
//       _controller.play();
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('مشغل الفيديو')),
//       body: Center(
//         child: _controller.value.isInitialized
//             ? AspectRatio(
//                 aspectRatio: _controller.value.aspectRatio,
//                 child: VideoPlayer(_controller),
//               )
//             : const CircularProgressIndicator(),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             _controller.value.isPlaying
//                 ? _controller.pause()
//                 : _controller.play();
//           });
//         },
//         child: Icon(
//           _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//         ),
//       ),
//     );
//   }
// }


