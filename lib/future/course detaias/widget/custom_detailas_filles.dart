import 'dart:developer';
import 'dart:io';

import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';

import '../../../core/Router/route_string.dart';
import '../cubit/video_course_cubit.dart';
import '../data/models/response_pdf/response_pdf.dart';

class CustomDetailasFilles extends StatefulWidget {
  const CustomDetailasFilles({
    super.key,
    required this.value,
    required this.isDownloading,
    required this.isfillexit,
  });
  final ResponsePdf value;
  final bool isDownloading;

  final bool isfillexit;

  @override
  State<CustomDetailasFilles> createState() => _CustomDetailasFillesState();
}

class _CustomDetailasFillesState extends State<CustomDetailasFilles> {
  final ValueNotifier<bool> fileExists = ValueNotifier(false);
  final ValueNotifier<String> filePaths = ValueNotifier('');

  Future<void> fileExist(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/$fileName';

    filePaths.value = filePath;
    fileExists.value = File(filePath).existsSync();
  }

  @override
  void initState() {
    super.initState();
    fileExist(widget.value.title);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () async {
                  try {
                    final directory = await getApplicationDocumentsDirectory();
                    final filePath = '${directory.path}/${widget.value.title}';

                    if (File(filePath).existsSync()) {
                      File(filePath).delete();
                      log('File delete: $filePath');
                    }
                  } catch (e) {
                    log("Error checking local file: ${e.toString()}");
                  }
                },
                child: Container(
                  width: 46,
                  height: 46,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const ShapeDecoration(
                    color: Color(0xFFF4F8FE),
                    shape: OvalBorder(
                      side: BorderSide(width: 2, color: Color(0xFFE8F1FF)),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '${1}',
                      style: context.textStyle.titleSmall!.copyWith(
                        color: const Color(0xFF202244),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Why  ${widget.value.title}",
                      style: context.textStyle.headlineSmall!.copyWith(
                        color: const Color(0xFF202244),
                      ),
                    ),
                  ),
                  Text(
                    '15 Mins',
                    style: context.textStyle.displaySmall!.copyWith(
                      color: const Color(0xFF545454),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              widget.isDownloading
                  ? BlocSelector<VideoCourseCubit, VideoCourseState, double>(
                      selector: (state) =>
                          state is ProgressPdf ? state.progress : 0.0,
                      builder: (context, state) {
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            CircularProgressIndicator(
                              value: state,
                              strokeWidth: 2.5,
                              backgroundColor: Colors.grey.shade200,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.blue),
                            ),
                            Text(
                              '${(state * 100).toStringAsFixed(1)}%',
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.blue),
                            ),
                          ],
                        );
                      },
                    )
                  : ValueListenableBuilder<bool>(
                      valueListenable: fileExists,
                      builder: (context, fileExistsValue, child) {
                        return IconButton(
                            icon: context
                                        .read<VideoCourseCubit>()
                                        .fillgStatuspdf[widget.value.title] ??
                                    fileExistsValue
                                ? const Icon(
                                    Icons.insert_drive_file,
                                    color: Color(0xFF0961F5),
                                    size: 30,
                                  )
                                : const Icon(
                                    Icons.download,
                                    size: 30,
                                  ),
                            onPressed: context
                                        .read<VideoCourseCubit>()
                                        .fillgStatuspdf[widget.value.title] ??
                                    fileExistsValue
                                ? () {
                                    log('Opening PDF');

                                    context.pushName(
                                        StringRoute.pdfViewerScreen,
                                        arguments: filePaths.value);
                                  }
                                : () {
                                    context.read<VideoCourseCubit>().playpdf(
                                          widget.value.url,
                                          widget.value.title,
                                        );
                                  });
                      },
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
