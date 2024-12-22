import 'package:flutter/material.dart';

import '../Qiez/exam_overview/view/exam_overview_page.dart';
import '../Qiez/models/exam_overview_model/examOverViewModel.dart';
import 'widget/custom_bottom_navigation_bar.dart';
import 'widget/main_view_body.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const routeName = 'home_view';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ExamOverviewPage(
      exams: ExamsOverview(
        id: 1,
        title: 'mohemde',
        allowBack: 4,
        breakExists: true,
        desc: 2,
        examPackage: 'ffff',
        startTime: '2:40',
        showAnswer: 8,
        examTime: 11,
        minScore: 6,
        examPackageId: 111,
      ),
    );

    //     Scaffold(
    //   bottomNavigationBar: CustomBottomNavigationBar(
    //     onItemTapped: (index) {
    //       currentViewIndex = index;
    //       setState(() {});
    //     },
    //   ),
    //   body: SafeArea(
    //     child: MainViewBody(currentViewIndex: currentViewIndex),
    //   ),
    // );
  }
}
