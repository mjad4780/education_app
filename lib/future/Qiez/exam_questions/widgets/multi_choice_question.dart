// //multiple choice
// import 'package:flutter/material.dart';
//
//
// import '../../cubit/exam_questions_cubit/cubit.dart';
//
// class MultiChoice extends StatefulWidget {
//   const MultiChoice({super.key });
//
//   @override
//   State<MultiChoice> createState() => _MultiChoiceState();
// }
//
// class _MultiChoiceState extends State<MultiChoice> {
//
//   bool answer1 = false;
//   bool answer2 = false;
//   bool answer3 = false;
//   bool answer4 = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final cubit = ExamsCubit.get(context);
//     final examquestionsData = cubit.examquestionsData;
//     return Column(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//               border: Border.all(
//                 color: const Color.fromRGBO(243,  244,  246,  1),
//                 width: 1,
//               ),
//               borderRadius: const BorderRadius.all(Radius.circular(12))
//           ),
//           child: CheckboxListTile(
//               title: Text(
//                 '${examquestionsData?.data?[0].options?[0].title}',
//                 style: const TextStyle(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 14
//                 ),
//               ),
//               controlAffinity: ListTileControlAffinity.leading,
//               activeColor: const Color(0xff0225FF),
//               value: answer1,
//               onChanged: (val){
//                 setState(() {
//                   answer1 = val!;
//                 });
//               }
//           ),
//         ),
//         const SizedBox(height: 8,),
//         Container(
//           decoration: BoxDecoration(
//               border: Border.all(
//                 color: const Color.fromRGBO(243,  244,  246,  1),
//                 width: 1,
//               ),
//               borderRadius: const BorderRadius.all(Radius.circular(12))
//           ),
//           child: CheckboxListTile(
//               title: Text(
//                 '${examquestionsData?.data?[0].options?[1].title}',
//                 style: const TextStyle(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 14
//                 ),
//               ),
//               controlAffinity: ListTileControlAffinity.leading,
//               activeColor: const Color(0xff0225FF),
//
//               value: answer2,
//               onChanged: (val){
//                 setState(() {
//                   answer2 = val!;
//                 });
//               }
//           ),
//         ),
//         const SizedBox(height: 8,),
//         Container(
//           decoration: BoxDecoration(
//               border: Border.all(
//                 color: const Color.fromRGBO(243,  244,  246,  1),
//                 width: 1,
//               ),
//               borderRadius: const BorderRadius.all(Radius.circular(12))
//           ),
//           child: CheckboxListTile(
//               title: Text(
//                 '${examquestionsData?.data?[0].options?[2].title}',
//                 style: const TextStyle(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 14
//                 ),
//               ),
//               controlAffinity: ListTileControlAffinity.leading,
//               activeColor: const Color(0xff0225FF),
//
//               value: answer3,
//               onChanged: (val){
//                 setState(() {
//                   answer3 = val!;
//                 });
//               }
//           ),
//         ),
//         const SizedBox(height: 8,),
//         Container(
//           decoration: BoxDecoration(
//               border: Border.all(
//                 color: const Color.fromRGBO(243,  244,  246,  1),
//                 width: 1,
//               ),
//               borderRadius: const BorderRadius.all(Radius.circular(12))
//           ),
//           child: CheckboxListTile(
//               title: Text(
//                 '${examquestionsData?.data?[0].options?[3].title}',
//                 style: const TextStyle(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 14
//                 ),
//               ),
//               controlAffinity: ListTileControlAffinity.leading,
//               activeColor: const Color(0xff0225FF),
//
//               value: answer4,
//               onChanged: (val){
//                 setState(() {
//                   answer4 = val!;
//                 });
//               }
//           ),
//         )
//       ],
//     );
//   }
// }
//multi choiv

import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/exam_questions_model/exam_questions_model.dart';
import '../bloc/cubit.dart';

class MultiChoice extends StatelessWidget {
  final DataQuestions? model;
  final int questionIndex;

  const MultiChoice({super.key, this.model, required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    final cubit = ExamsCubit.get(context);
    final selectedOptions =
        cubit.selectedOptionsForQuestion(questionIndex) ?? '';

    return SizedBox(
      height: 320,
      child: ListView.separated(
        itemBuilder: (context, index) => Column(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
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
                      activeColor: mainColor,
                      value: selectedOptions
                          .contains(model?.options![index].key ?? ''),
                      onChanged: (val) {
                        cubit.updateMultiOption(
                            questionIndex, model?.options?[index].key ?? '');
                      }),
                ),
              ],
            ),
          ],
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 8,
        ),
        itemCount: model?.options?.length ?? 0,
      ),
    );
  }
}
