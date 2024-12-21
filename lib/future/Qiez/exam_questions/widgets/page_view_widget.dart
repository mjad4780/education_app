import 'dart:developer';

import 'package:flutter/material.dart';

import '../bloc/cubit.dart';
import 'multi_choice_question.dart';
import 'single_choice_question.dart';

class PageViewWidget extends StatelessWidget {
  final questionsController;

  final examquestionsData;
  final questionIndex;

  final cubit;

  const PageViewWidget(
      {super.key,
      required this.questionsController,
      required this.examquestionsData,
      required this.questionIndex,
      required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: questionsController,
        itemCount: examquestionsData?.data?.length ?? 0,
        onPageChanged: (int index) {
          ExamsCubit.get(context).updateCurrentIndex(index);
        },
        itemBuilder: (context, index) {
          if (questionIndex != null) index = questionIndex!;
          log("This the Index : $index");
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 0.5,
                  width: double.infinity,
                  color: const Color(0xffF0F0F0),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 0.5,
                  width: 355,
                  color: const Color(0xffF0F0F0),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${index + 1} -  ${examquestionsData?.data?[index].title}',
                      style: const TextStyle(
                        color: Color(0xff020939),
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                cubit.showimage
                    ? Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: (examquestionsData
                                        ?.data?[index].attachment?.url !=
                                    "https://zakreators.com/admin_panel/img/uploads/image")
                                ? Image(
                                    image: NetworkImage(examquestionsData
                                            ?.data?[index].attachment?.url ??
                                        ''),
                                    fit: BoxFit.cover,
                                    width: 327,
                                    height: 146,
                                  )
                                : const Image(
                                    image: NetworkImage(
                                        "https://s3-alpha-sig.figma.com/img/5bfb/8dde/08100b2cd65af4064f8a80863926b854?Expires=1711324800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=BHnzZWoYfAbO16GZPXsMGmxTe~o756Uix7U6ii6FxRl0GYrdyPq3OThNerXmf7aaIszaDdwAqet36yrVk1TrGJpCY4X~u3tpfgBvVLWL-VnOHkwTSRjiviYKmEl8n8~5Iv83tAtwV5eLrSfrRcOaTs4v2rPhKCibO4z8v5pFvv53zaxPxsMfquof425OgV3CH2p2w496NztFOEeZExPAExGl8~uJs~qr82sjUc~2iG1bHpBG4qD56bBiaAZ8fJ6T22m5NCVSvF8FGBLPLDKcWr9deJvSosHV~DRMKxjpTmiMSJrUuNNNyGKWBWH7enw~fYmF7KRqQAGyaQSyKkhBxw__"),
                                    fit: BoxFit.cover,
                                    width: 327,
                                    height: 146,
                                  ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 285.0),
                            child: Container(
                              alignment: Alignment.center,
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  cubit.IsVisible();
                                },
                                child: const Icon(
                                  Icons.hide_image_outlined,
                                  color: Color(0xff0225FF),
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 270.0),
                        child: SizedBox(
                          height: 20,
                          child: IconButton(
                            icon: const Icon(
                              Icons.image,
                              size: 20,
                            ),
                            color: const Color(0xff0225FF),
                            onPressed: () {
                              cubit.IsVisible();
                            },
                          ),
                        ),
                      ),
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Answers',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto',
                      color: Color(0xff9CA3AF),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                examquestionsData?.data?[index].multiple != 0
                    ? MultiChoice(
                        model: examquestionsData?.data?[index],
                        questionIndex: examquestionsData?.data?[index].id ?? 0,
                      )
                    : SingleChoice(
                        model: examquestionsData?.data?[index],
                        questionIndex: examquestionsData?.data?[index].id ?? 0,
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
