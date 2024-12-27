import 'package:flutter/material.dart';

import '../constants.dart';

class ReportHeader extends StatefulWidget {
  final int score;
  // final String message;

  const ReportHeader({
    super.key,
    required this.score,
  });

  @override
  State<ReportHeader> createState() => _ReportHeaderState();
}

Color? headerColor;
Color? textColor;
String? emoji;
String? text1;

class _ReportHeaderState extends State<ReportHeader> {
  ini() {
    if (widget.score <= 59) {
      headerColor = examReportFailHeader;
      textColor = examReportFailColor;
      textColor = examReportFailColor;
      emoji = "😢";
      text1 = "You can do better!";
    } else if (widget.score >= 60 && widget.score < 80) {
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
  }

  @override
  void initState() {
    super.initState();
    ini();
  }

  @override
  Widget build(BuildContext context) {
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
                emoji!,
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
                    text1!,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  // Text(
                  //   widget.message,
                  //   style: TextStyle(
                  //     color: description,
                  //   ),
                  //   maxLines: 4,
                  //   overflow: TextOverflow.ellipsis,
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
