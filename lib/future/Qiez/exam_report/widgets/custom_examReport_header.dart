import 'package:flutter/material.dart';

import '../../constants.dart';

class ReportHeader extends StatelessWidget {
  final int score;
  final String message;

  const ReportHeader({super.key, required this.score, required this.message});

  @override
  Widget build(BuildContext context) {
    Color headerColor;
    Color textColor;
    String emoji;
    String text1;

    if (score <= 59) {
      headerColor = examReportFailHeader;
      textColor = examReportFailColor;
      textColor = examReportFailColor;
      emoji = "😢";
      text1 = "You can do better!";
    } else if (score >= 60 && score < 80) {
      headerColor = examReportPassHeader;
      textColor = examReportPassColor;
      emoji = "😊";
      text1 = "Congratulations!";
    } else {
      headerColor = examReportSuccessHeader;
      textColor = examReportSuccessColor;
      emoji = "🤩";
      text1 = "Well Done!";
    }

    return Container(
      decoration: BoxDecoration(
        color: headerColor,
      ),
      height: 140,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 24, end: 24),
        child: Row(
          children: [
            CircleAvatar(
              radius: 39,
              backgroundColor: Colors.white,
              child: Text(
                emoji,
                style: TextStyle(fontSize: 45, color: textColor),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text1,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    message,
                    style: TextStyle(
                      color: description,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
