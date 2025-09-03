import 'package:education/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/exam_cubit.dart';
import '../../models/exam_overview_model/examOverViewModel.dart';
import '../../models/exam_questions_model/exam_questions_model.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet(
      {super.key,
      required this.data,
      required this.updatePageViewController,
      required this.exams});
  final ExamsOverview exams;
  final List<DataQuestions>? data;
  final Function(int) updatePageViewController; // Callback function

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "All Questions ",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff030712),
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.highlight_off_outlined),
              )
            ],
          ),
          verticalSpace(8),
          Expanded(
            child: ListView.separated(
              itemCount:
                  context.read<ExamCubit>().examquestionsData.data?.length ?? 0,
              padding: const EdgeInsets.only(bottom: 3),
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemBuilder: (BuildContext context, int index) {
                return ReviewQuestions(
                  list: context.read<ExamCubit>().examquestionsData.data,
                  index: index,
                  updatePageViewController:
                      updatePageViewController, // Pass callback function
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewQuestions extends StatelessWidget {
  const ReviewQuestions({
    super.key,
    required this.list,
    required this.index,
    required this.updatePageViewController, // Callback function added
  });

  final List<DataQuestions>? list;
  final int index;
  final Function(int) updatePageViewController; // Callback function

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Call the callback function to update page view controller
        updatePageViewController(index);
      },
      child: SizedBox(
        height: 40,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44,
              height: 34,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xffF3F4FF),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(list![index].id.toString(),
                      style: const TextStyle(color: Color(0xff0225FF))),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: Color(0xff0225FF),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(list![index].title!),
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
