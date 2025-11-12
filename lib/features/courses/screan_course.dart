import 'package:education/app/education_app.dart'; // تأكد من الاستيراد
import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/get_it/get_it.dart';
import 'package:education/core/helpers/cache_helper.dart';
import 'package:education/features/courses/cubit/my_course_cubit.dart';
import 'package:education/features/courses/widget/complted_course_bloc.dart';
import 'package:education/features/main/cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/language/lang_keys.dart';
import '../../utility/images_aseets.dart';
import '../../widget/app_text_form_field.dart';

class ScreenCourses extends StatefulWidget {
  const ScreenCourses({super.key});

  @override
  State<ScreenCourses> createState() => _ScreenCoursesState();
}

class _ScreenCoursesState extends State<ScreenCourses> with RouteAware {
  ValueNotifier<List<CourseProgress>> coursesNotifier = ValueNotifier([]);

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);

    final watched = CacheHelper.getAllCourses();

    coursesNotifier.value = watched;
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    coursesNotifier.dispose();
    super.dispose();
  }

  @override
  void didPopNext() {
    final watched = CacheHelper.getAllCourses();

    coursesNotifier.value = watched;
  }

  @override
  Widget build(BuildContext context) {
    // CacheHelper().removeData(key: 'watched_videos');
    return BlocProvider(
      create: (context) => getIt<MyCourseCubit>()..getCompletedCourse(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 35,
                ),
                onPressed: () async {
                  context.read<MainCubit>().changeIndex(0);
                },
              ),
              title: Text(context.translate(LangKeys.myCourses),
                  style: context.textStyle.bodyLarge),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 13),
                child: AppTextFormField(
                  hintText: context.translate(LangKeys.search),
                  validator: (p0) {},
                  suffixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: SvgPicture.asset(
                      Assets.imagesSearchBlue,
                      height: 50,
                    ),
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              child: CompletedCourseBlocBuilder(
                valueNotifier: coursesNotifier,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
