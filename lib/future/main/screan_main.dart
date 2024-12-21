import 'package:flutter/material.dart';

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
    return
        // const Scaffold(
        //   body: Center(
        //     child: ProgressDialogContent(
        //       name: 'download',
        //       downloadUrl:
        //           'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
        //     ),
        //   ),
        // );

        Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: (index) {
          currentViewIndex = index;
          setState(() {});
        },
      ),
      body: SafeArea(
        child: MainViewBody(currentViewIndex: currentViewIndex),
      ),
    );
  }
}
