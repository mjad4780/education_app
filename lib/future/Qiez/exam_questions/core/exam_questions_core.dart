import 'package:flutter/material.dart';

import '../widgets/dialog_custom.dart';

void pauseExam({
  required context,
  required controller,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        title: 'Pause Exam',
        imageUrl: 'assets/images/pausetimer.PNG',
        onConfirm: () {
          controller.pause();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Timer stopped'),
            ),
          );
        },
        onCancel: () {
          Navigator.pop(context);
          controller.resume();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Timer Resumed'),
            ),
          );
        },
        subTitle: 'Are you sure you want to pause exam ?',
        leftColor: const Color(0xff0225FF),
        buttonText: 'Pause',
      );
    },
  );
}
