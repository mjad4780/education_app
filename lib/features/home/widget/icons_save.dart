import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:education/features/home/cubit/home_cubit.dart';
import '../../../utility/images_aseets.dart';

class SaveIcons extends StatelessWidget {
  final String courseId;

  const SaveIcons({super.key, required this.courseId});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      buildWhen: (previous, current) {
        if (current is HomeUpdateFavoritesState) {
          return current.courseId == courseId;
        }
        return false;
      },
      builder: (context, state) {
        final isSaved = context.read<HomeCubit>().isCourseSaved(courseId);

        return GestureDetector(
          onTap: () {
            context.read<HomeCubit>().toggleCourseSave(courseId);
          },
          child: SvgPicture.asset(
            isSaved ? Assets.imagesActiveSave : Assets.noActiveSave,
            height: 21,
            theme: SvgTheme(
                currentColor:
                    isSaved ? context.color.teal : const Color(0xFF000000)),
          ),
        );
      },
    );
  }
}
