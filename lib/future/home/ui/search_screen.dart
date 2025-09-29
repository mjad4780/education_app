import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/future/home/cubit/home_cubit.dart';
import 'package:education/future/home/data/model/response_home/course.dart';
import 'package:education/utility/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/language/lang_keys.dart';
import '../../../utility/images_aseets.dart';
import '../../../widget/app_text_form_field.dart';
import '../widget/widget polupar/custom_widget_course_polupar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.cubit});
  final HomeCubit cubit;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void dispose() {
    if (context.mounted) {
      context.read<HomeCubit>().debounceTimer?.cancel();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: widget.cubit..loadSavedHints(),
        child: Builder(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 35,
                ),
                onPressed: () {
                  context.pop();
                },
              ),
              title: Text(context.translate(LangKeys.search),
                  style: context.textStyle.bodyLarge),
            ),
            body: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 13),
                      child: AppTextFormField(
                        controller: context.read<HomeCubit>().query,
                        hintText: context.translate(LangKeys.search),
                        validator: (p0) {},
                        onChanged: (value) {
                          context.read<HomeCubit>().searchWithDebounce(value);
                          if (value.isEmpty) {
                            context.read<HomeCubit>().debounceTimer?.cancel();

                            context.read<HomeCubit>().loadSavedHints();
                          }
                        },
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13),
                          child: GestureDetector(
                            onTap: () {
                              context.read<HomeCubit>().immediateSearch();
                            },
                            child: SvgPicture.asset(
                              Assets.imagesSearchBlue,
                              height: 45,
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (context.read<HomeCubit>().query.text.isEmpty)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BlocBuilder<HomeCubit, HomeState>(
                          // buildWhen: (prev, curr) => curr is SearchHintTextState,
                          builder: (context, state) {
                            List<String> hints = state is SearchHintTextState
                                ? state.hintText
                                : [];

                            return hints.isNotEmpty
                                ? SingleChildScrollView(
                                    child: Column(
                                        children: List.generate(
                                            hints.length,
                                            (index) => CustomHintText(
                                                  hintText: hints[index],
                                                ))),
                                  )
                                : const Center(
                                    child: Text(' Start searching... '));
                          },
                        ),
                      ),
                    if (context.read<HomeCubit>().query.text.isNotEmpty)
                      BlocBuilder<HomeCubit, HomeState>(
                        buildWhen: (previous, current) =>
                            current is SearchCourseLoadingState ||
                            current is SearchCourseSuccessState ||
                            current is SearchCourseFailerState,
                        builder: (context, state) {
                          if (state is SearchCourseLoadingState) {
                            return Expanded(
                              child: LoadingWidget(
                                  child: CustomWidgetPoluparCourse(
                                course: [
                                  Course(),
                                  Course(),
                                  Course(),
                                  Course()
                                ],
                              )),
                            );
                          } else if (state is SearchCourseSuccessState) {
                            return Expanded(
                                child: CustomWidgetPoluparCourse(
                              course: state.courses,
                            ));
                          } else if (state is SearchCourseFailerState) {
                            return Center(child: Text(state.messege));
                          } else {
                            return const Center(child: Text("Start searching"));
                          }
                        },
                      ),
                  ],
                );
              },
            ),
          );
        }));
  }
}

class CustomHintText extends StatelessWidget {
  const CustomHintText({
    super.key,
    required this.hintText,
  });
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<HomeCubit>().immediateSearch(hintText);
      },
      child: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Row(
          children: [
            Text(
              hintText,
              style: const TextStyle(
                color: Color(0xFFA0A4AB),
                fontSize: 15,
                fontFamily: 'Mulish',
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            InkWell(
                onTap: () => context.read<HomeCubit>().removeHint(hintText),
                child: const Icon(Icons.close))
          ],
        ),
      ),
    );
  }
}
