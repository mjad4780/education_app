import 'package:flutter/material.dart';

import '../../constants.dart';

// ignore: must_be_immutable
class CustomDetailsCard extends StatelessWidget {
  CustomDetailsCard({
    super.key,
    required this.title,
    required this.iconName,
    this.questionsCount,
    this.minScore,
  });
  String title;

  IconData iconName;
  int? minScore;
  int? questionsCount;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 155.5,
        // height: 54,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xffF3F4F6))),
        child: Row(
          //inside square
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  width: 38,
                  height: 38,
                  color: iconBackgroundColor,
                  child: Icon(
                    iconName,
                    color: mainColor,
                    size: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style:
                        const TextStyle(fontSize: 12, color: Color(0xff9CA3AF)),
                  ),
                  title == "Questions"
                      ? Text(
                          "$questionsCount",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )
                      : Text(
                          "$minScore",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
