//score circle
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../constants.dart';

class ScoreCircle extends StatelessWidget {
  final int score;
  final int questionNumbers;
  final int iscorrect;
  const ScoreCircle(
      {super.key,
      required this.score,
      required this.questionNumbers,
      required this.iscorrect});

  @override
  Widget build(BuildContext context) {
    Color color;
    if (score >= 80) {
      color = examReportSuccessColor;
    } else if (score >= 60 && score < 80) {
      color = examReportPassColor;
    } else {
      color = examReportFailColor;
    }

    return CustomPaint(
      size: const Size(270, 270),
      painter: ScoreCirclePainter(
          score: score,
          color: color,
          questionNumbers: questionNumbers,
          iscorrect: iscorrect),
    );
  }
}

class ScoreCirclePainter extends CustomPainter {
  final int score;
  final Color color;
  final int questionNumbers;
  final int iscorrect;
  ScoreCirclePainter(
      {required this.score,
      required this.color,
      required this.questionNumbers,
      required this.iscorrect});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = size.width / 9
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Paint greyPaint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = size.width / 9
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius =
        math.min(size.width / 2, size.height / 2) - paint.strokeWidth / 2;

    double totalAngle = math.pi * 1.0; // 90 degrees clockwise from the top
    double sweepAngle = (score / 100) * totalAngle;

    // Draw grey arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi + sweepAngle,
      totalAngle - sweepAngle,
      false,
      greyPaint,
    );

    // Draw colored arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi,
      sweepAngle,
      false,
      paint,
    );

    // Write score text
    TextSpan scoreSpan = TextSpan(
      style: TextStyle(
        color: color,
        fontSize: 25.39,
        fontWeight: FontWeight.w700,
      ),
      text: '$score%',
    );
    TextPainter scoreTp = TextPainter(
      text: scoreSpan,
      textAlign: TextAlign.start,
      textDirection: TextDirection.ltr,
    );
    scoreTp.layout();
    scoreTp.paint(
      canvas,
      Offset(center.dx - scoreTp.width / 2, center.dy - scoreTp.height * 2),
    );

    // Write additional text below the score
    TextSpan additionalSpan = TextSpan(
      style: TextStyle(
        color: smallDescriptionText,
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
      ),
      text: '$iscorrect out of $questionNumbers',
    );
    TextPainter additionalTp = TextPainter(
      text: additionalSpan,
      textAlign: TextAlign.start,
      textDirection: TextDirection.ltr,
    );
    additionalTp.layout();
    additionalTp.paint(
      canvas,
      Offset(
          center.dx - additionalTp.width / 2, center.dy - scoreTp.height * 0.7),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
