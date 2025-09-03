import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/language/lang_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/spacing.dart';
import '../logic/cubit/mentor_cubit.dart';

class ActionTabsMentor extends StatelessWidget {
  const ActionTabsMentor({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocSelector<MentorCubit, MentorState, bool>(
      selector: (state) => state is WatchRebuild
          ? state.rebuild
          : context.read<MentorCubit>().rebuildCourse,
      builder: (context, rebuild) {
        return Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  context.read<MentorCubit>().watchcourse(
                        false,
                      );
                },
                child: Container(
                  height: height(context) / 23,
                  decoration: ShapeDecoration(
                    color: rebuild
                        ? const Color(0xFFF4F8FE)
                        : const Color(0xFFE8F1FF),
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(width: 2, color: Color(0xFFE8F1FF)),
                    ),
                  ),
                  child: Text(
                    context.translate(LangKeys.courses),
                    textAlign: TextAlign.center,
                    style: context.textStyle.titleMedium!.copyWith(
                      color: const Color(0xFF202244),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                child: GestureDetector(
              onTap: () {
                context.read<MentorCubit>().watchcourse(
                      true,
                    );
                // context.read<MentorCubit>().getCoursesMentor(id);
              },
              child: Container(
                height: height(context) / 23,
                decoration: ShapeDecoration(
                  color: rebuild
                      ? const Color(0xFFE8F1FF)
                      : const Color(0xFFF4F8FE),
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(width: 2, color: Color(0xFFE8F1FF)),
                  ),
                ),
                child: Text(
                  context.translate(LangKeys.rating),
                  textAlign: TextAlign.center,
                  style: context.textStyle.titleMedium!.copyWith(
                    color: const Color(0xFF202244),
                  ),
                ),
              ),
            )),
          ],
        );
      },
    );
  }
}
