import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/get_it/get_it.dart';
import 'package:education/core/helpers/spacing.dart';
import 'package:education/future/Qiez/cubit/exam_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/Router/route_string.dart';
import '../../../widget/app_text_button.dart';
import '../constants.dart';

import '../widget/custom_details_card.dart';

class ExamOverviewPage extends StatelessWidget {
  const ExamOverviewPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ExamCubit>(),
      child: Builder(builder: (context) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: context.color.greyLight,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: iconBackgroundColor,
                  radius: 14,
                  child: IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 20,
                    ),
                    color: mainColor,
                  ),
                ),
              ),
              title: Text(
                context.read<ExamCubit>().examOverviewData!.data!.title ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsetsDirectional.only(start: 24, end: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  Container(
                    height: 0.5,
                    width: double.infinity,
                    color: Colors.grey.withOpacity(0.4),
                  ),
                  const SizedBox(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${context.read<ExamCubit>().examOverviewData!.data!.title}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff020939),
                            fontSize: 20),
                      ),
                      (context
                                  .read<ExamCubit>()
                                  .examOverviewData!
                                  .data!
                                  .description !=
                              '')
                          ? const SizedBox(height: 20)
                          : const SizedBox(),
                      Text(
                        '${context.read<ExamCubit>().examOverviewData!.data!.description}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff4B5563),
                            fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      CustomDetailsCard(
                          questionsCount: context
                              .read<ExamCubit>()
                              .examOverviewData!
                              .data!
                              .examsCount,
                          title: "Questions",
                          iconName: Icons.description_outlined),
                      const SizedBox(width: 16),
                      CustomDetailsCard(
                        title: "Min score",
                        iconName: Icons.gpp_good_outlined,
                        minScore: context
                            .read<ExamCubit>()
                            .examOverviewData!
                            .data!
                            .discountPrice,
                      ),
                    ],
                  ),
                  const Spacer(flex: 1),
                  const Row(children: [
                    Text(
                      " Your grade",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff020939)),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Text("---")
                  ]),
                  verticalSpace(3),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppTextButton(
                      buttonText: 'Start Exam',
                      onPressed: () {
                        context.pushName(StringRoute.examQuestionsPage,
                            arguments: context.read<ExamCubit>());
                      },
                    ),
                  )
                ],
              ),
            ));
      }),
    );
  }
}
