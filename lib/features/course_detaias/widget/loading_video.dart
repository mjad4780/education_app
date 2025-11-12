import 'package:education/utility/loading.dart';
import 'package:flutter/material.dart';

class CourseDetailsShimmer extends StatelessWidget {
  const CourseDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: LoadingWidget(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            ),
            Container(
              height: 30,
              width: 200,
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            ),
            Container(
              height: 20,
              width: double.infinity,
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            ),
            ...List.generate(
              10,
              (index) => Container(
                height: 60,
                width: double.infinity,
                color: Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
