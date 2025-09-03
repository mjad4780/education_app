import 'package:education/core/get_it/get_it.dart';
import 'package:education/future/main/cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../Qiez/view/exam_overview_page.dart';
import 'widget/custom_bottom_navigation_bar.dart';
import 'widget/main_view_body.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MainCubit>(),
      child: Builder(builder: (context) {
        return BlocBuilder<MainCubit, MainState>(
          buildWhen: (previous, current) => current is MainIndex,
          builder: (context, state) {
            var i = state is MainIndex ? state.index : 0;

            return Scaffold(
              bottomNavigationBar: CustomBottomNavigationBar(
                i: i,
              ),
              body: SafeArea(
                child: MainViewBody(
                  currentViewIndex: i,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
