import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/video_course_cubit.dart';
import 'dart:io';
import '../data/models/detailashome/video.dart';

class TitleVideoDetailas extends StatefulWidget {
  const TitleVideoDetailas({
    super.key,
    required this.value,
    required this.isDownloading,
    required this.progress,
    required this.isfillexit,
    required this.free,
  });

  final Video value;
  final bool isDownloading;
  final bool free;
  final bool isfillexit;
  final double progress;

  @override
  State<TitleVideoDetailas> createState() => _TitleVideoDetailasState();
}

class _TitleVideoDetailasState extends State<TitleVideoDetailas> {
  final ValueNotifier<bool> _fileExists = ValueNotifier(false);
  final ValueNotifier<String> _filePath = ValueNotifier('');

  @override
  void initState() {
    super.initState();
    _checkFileExists(widget.value.title!);
  }

  Future<void> _checkFileExists(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/$fileName';

    _filePath.value = path;
    _fileExists.value = File(path).existsSync();
  }

  void _handleVideoTap(VideoCourseCubit cubit) {
    if (!widget.free) return;

    _fileExists.value
        ? cubit.initializeVideo(_filePath.value)
        : cubit.initializeVideo(widget.value.url!, isAsset: false);
  }

  void _handleDeleteCache(VideoCourseCubit cubit) {
    cubit.deleteVideoCache(widget.value.title!);
  }

  void _handleDownload(VideoCourseCubit cubit) {
    if (widget.free &&
        !(_fileExists.value || cubit.fillgStatus[widget.value.title]!)) {
      cubit.play(widget.value.url!, widget.value.title!);
    }
  }

  Widget _buildProgressIndicator(double progress) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircularProgressIndicator(
          value: progress,
          strokeWidth: 2.5,
          backgroundColor: Colors.grey.shade200,
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
        Text(
          '${(progress * 100).toStringAsFixed(1)}%',
          style: const TextStyle(fontSize: 12, color: Colors.blue),
        ),
      ],
    );
  }

  Widget _buildDownloadButton(VideoCourseCubit cubit) {
    return ValueListenableBuilder<bool>(
      valueListenable: _fileExists,
      builder: (context, exists, _) {
        final isDownloaded = cubit.fillgStatus[widget.value.title!] ?? exists;

        return IconButton(
          icon: isDownloaded
              ? const Icon(Icons.play_circle_fill,
                  color: Color(0xFF0961F5), size: 30)
              : widget.free
                  ? const Icon(Icons.download, size: 28)
                  : const Icon(Icons.lock, size: 28),
          onPressed: isDownloaded ? null : () => _handleDownload(cubit),
        );
      },
    );
  }

  Widget _buildVideoInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              widget.value.title!,
              overflow: TextOverflow.ellipsis,
              style: context.textStyle.headlineSmall!.copyWith(
                fontSize: 12.sp,
                color: const Color(0xFF202244),
              ),
            )),
        Text(
          '15 Mins',
          style: context.textStyle.displaySmall!.copyWith(
            color: const Color(0xFF545454),
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildNumberIndicator() {
    return Container(
      width: 43,
      height: 43,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const ShapeDecoration(
        color: Color(0xFFF4F8FE),
        shape: OvalBorder(
          side: BorderSide(width: 2, color: Color(0xFFE8F1FF)),
        ),
      ),
      child: Center(
        child: Text(
          '${widget.value.id}',
          style: context.textStyle.titleSmall!.copyWith(
            color: const Color(0xFF202244),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VideoCourseCubit>();

    return Column(
      children: [
        GestureDetector(
          onTap: () => _handleVideoTap(cubit),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => _handleDeleteCache(cubit),
                  child: _buildNumberIndicator(),
                ),
                const SizedBox(width: 2),
                _buildVideoInfo(context),
                const Spacer(),
                widget.isDownloading
                    ? BlocSelector<VideoCourseCubit, VideoCourseState, double>(
                        selector: (state) =>
                            state is Progress ? state.progress : 0.0,
                        builder: (context, progress) =>
                            _buildProgressIndicator(progress),
                      )
                    : _buildDownloadButton(cubit),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
