import 'package:education/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

class CourseProgressWidget extends StatelessWidget {
  final int totalVideos;
  final int completedVideos;

  const CourseProgressWidget({
    super.key,
    required this.totalVideos,
    required this.completedVideos,
  });
  double get progress => completedVideos / totalVideos;

  // قائمة الألوان بناءً على نسبة التقدم
  static final List<Color> progressColors = [
    Colors.red, // 0% - 20%
    Colors.orange, // 21% - 40%
    Colors.yellow, // 41% - 60%
    Colors.lightGreen, // 61% - 80%
    Colors.green, // 81% - 100%
  ];

  // اختيار اللون بناءً على نسبة التقدم
  Color _getProgressColor(double progress) {
    int index = (progress * (progressColors.length - 1)).floor();
    return progressColors[index];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: SizedBox(
        width: width(context) / 3,
        child: LinearProgressIndicator(
          borderRadius: BorderRadius.circular(22),
          value: progress,
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(
            _getProgressColor(progress),
          ),
          minHeight: 8,
        ),
      ),
    );
  }
}
