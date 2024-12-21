import 'package:flutter/material.dart';

import '../../models/exam_report_model/exam_report_model.dart';

class MultiChoice extends StatelessWidget {
  final Questions? model;
  const MultiChoice({super.key, this.model});

  @override
  Widget build(BuildContext context) {
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
                        child: CheckboxListTile(
                            title: Text(
                              '${model?.options?[index].title}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 14),
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: const Color.fromRGBO(89, 183, 100, 1),
                            value: true,
                            onChanged: (val) {}),
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
                          SizedBox(
                            width: 3,
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
                                  color: Colors.red,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12))),
                            child: CheckboxListTile(
                                title: Text(
                                  '${model?.options?[index].title}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                activeColor: Colors.red,
                                value: true,
                                onChanged: (val) {}),
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
                              SizedBox(
                                width: 3,
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
                        child: CheckboxListTile(
                            title: Text(
                              '${model?.options?[index].title}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 14),
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: const Color.fromRGBO(89, 183, 100, 1),
                            value: false,
                            onChanged: (val) {}),
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
