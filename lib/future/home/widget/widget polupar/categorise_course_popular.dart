import 'package:education/core/extensions/extention_navigator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/home_cubit.dart';

class CategoriseCoursePopular extends StatefulWidget {
  const CategoriseCoursePopular({
    super.key,
    required this.index,
    required this.homeCubit,
  });
  final int index;
  final HomeCubit homeCubit;
  @override
  State<CategoriseCoursePopular> createState() =>
      _CategoriseCoursePopularState();
}

class _CategoriseCoursePopularState extends State<CategoriseCoursePopular> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final position = widget.index * 120.0; // افترض أن كل عنصر عرضه 100 بكسل
      _scrollController.animateTo(
        position,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.homeCubit,
      child: BlocSelector<HomeCubit, HomeState, int>(
          selector: (state) =>
              state is UpdateCurrentIndexPoluapr ? state.index : widget.index,
          builder: (context, currentindex) {
            return SingleChildScrollView(
                controller: _scrollController, // ربط ScrollController هنا
                scrollDirection: Axis.horizontal,
                child: Builder(builder: (context) {
                  return Row(
                      children: List.generate(
                          context
                              .read<HomeCubit>()
                              .responseHome!
                              .platform!
                              .categories!
                              .length,
                          (i) => GestureDetector(
                                onTap: () => context
                                    .read<HomeCubit>()
                                    .updatecurrentendexbuplar(i),
                                child: Padding(
                                  padding: const EdgeInsets.all(11.0),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    constraints: const BoxConstraints(
                                        minHeight: 55, minWidth: 70),
                                    alignment: Alignment
                                        .center, // جعل المحتوى في المنتصف
                                    decoration: BoxDecoration(
                                        color: currentindex == i
                                            ? context.color.teal
                                            : const Color(0xFFE8F1FF),
                                        borderRadius:
                                            BorderRadius.circular(22)),
                                    child: Text(
                                        context.translate(
                                          context
                                                  .read<HomeCubit>()
                                                  .responseHome!
                                                  .platform!
                                                  .categories![i]
                                                  .name ??
                                              '',
                                        ),
                                        textAlign: TextAlign.center,
                                        style: context.textStyle.displaySmall!
                                            .copyWith(
                                                color: currentindex == i
                                                    ? const Color(0xFFE8F1FF)
                                                    : context.color.black,
                                                fontWeight: FontWeight.w700)),
                                  ),
                                ),
                              )));
                }));
          }),
    );
  }
}
