import 'package:flutter/material.dart';

import '../../models/exam_report_model/exam_report_model.dart';

class SingleChoice extends StatelessWidget {
  final Questions? model;
  const SingleChoice({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    String? opt;
    return SizedBox(
      height: 336,
      child: ListView.separated(
        itemBuilder: (context, index) => Column(
          children: [
            model?.options?[index].isCorrect != 0
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
                          groupValue: opt = '${model?.options?[index].title}',
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
                    ? Column(
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
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12))),
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
                              groupValue: opt = model?.options?[index].title,
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
                      )
                    : Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromRGBO(243, 244, 246, 1),
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
                          groupValue: opt,
                          onChanged: (val) {},
                        ),
                      ),
          ],
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 8,
        ),
        itemCount: 4,
      ),
    );
  }
}
