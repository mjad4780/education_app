import 'package:flutter/material.dart';

import '../../models/exam_report_model/exam_report_model.dart';

class SingleChoice extends StatelessWidget {
  final Questions? model;
  const SingleChoice({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(model!.options!.length, (index) {
      return model?.options?[index].isCorrect != 0
          ? Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(89, 183, 100, 1),
                        width: 1,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  child: RadioListTile(
                    title: Text(
                      '${model?.options?[index].title}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                    activeColor: const Color.fromRGBO(89, 183, 100, 1),
                    value: '${model?.options?[index].title}',
                    groupValue: '${model?.options?[index].title}',
                    onChanged: (val) {},
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      color: Color.fromRGBO(89, 183, 100, 1),
                      size: 13,
                    ),
                    Text(
                      'Right Answer',
                      style: TextStyle(
                          color: Color.fromRGBO(89, 183, 100, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    )
                  ],
                )
              ],
            )
          : model?.options?[index].isCorrect == 0 &&
                  model?.options?[index].isSelected == 1
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromRGBO(
                                230,
                                70,
                                70,
                                1,
                              ),
                              width: 1,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12))),
                        child: RadioListTile(
                          title: Text(
                            '${model?.options?[index].title}',
                            style: const TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                          activeColor: const Color.fromRGBO(
                            230,
                            70,
                            70,
                            1,
                          ),
                          value: '${model?.options?[index].title}',
                          groupValue: model?.options?[index].title,
                          onChanged: (val) {},
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.highlight_off,
                            color: Color.fromRGBO(
                              230,
                              70,
                              70,
                              1,
                            ),
                            size: 13,
                          ),
                          Text(
                            'Wrong Answer (Yours)',
                            style: TextStyle(
                                color: Color.fromRGBO(230, 70, 70, 1),
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          )
                        ],
                      )
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(bottom: 8, top: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 3, 29, 81),
                          width: 1,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12))),
                    child: RadioListTile(
                      title: Text(
                        '${model?.options?[index].title}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                      activeColor: const Color.fromRGBO(89, 183, 100, 1),
                      value: '${model?.options?[index].title}',
                      groupValue: null,
                      onChanged: (val) {},
                    ),
                  ),
                );
    }));
    //   },
    //   separatorBuilder: (context, index) => const SizedBox(
    //     height: 8,
    //   ),
    //   itemCount: model!.options!.length,
    // ),
    // );
  }
}
