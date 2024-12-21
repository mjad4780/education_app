import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/exam_overview_model/examOverViewModel.dart';
import '../../models/exam_questions_model/exam_questions_model.dart';
import '../bloc/cubit.dart';
import '../bloc/states.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet(
      {super.key,
      required this.data,
      required this.updatePageViewController,
      required this.exams});
  final ExamsOverview exams;
  final List<DataQuestions>? data;
  final Function(int) updatePageViewController; // Callback function

  // Map<int, Data> _searchResultsMap = {};

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          ExamsCubit()..getExamQuestions(id: exams.id),
      child: BlocConsumer<ExamsCubit, ExamQuestionStats>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ExamQuestionsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          var cubit = ExamsCubit.get(context);
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
                Container(
                  height: 48,
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (query) =>
                              ExamsCubit.get(context).filterExamPackages(query),
                          decoration: const InputDecoration(
                            hintText: 'Search for question',
                            prefixIcon: Icon(Icons.search),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 16),
                            prefixIconColor: Color(0xff9CA3AF),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(color: Color(0xffE5E7EB)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(color: Color(0xffE5E7EB)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: cubit.examquestionsData?.data?.length ?? 0,
                    padding: const EdgeInsets.only(bottom: 16),
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemBuilder: (BuildContext context, int index) {
                      return ReviewQuestions(
                        list: cubit.examquestionsData?.data,
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
        },
      ),
    );
  }

// void _searchQuestions(String query) {
//
//
// }
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
        height: 72,
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
