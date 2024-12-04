import 'package:flutter/material.dart';

import 'widget/course_details_card.dart';
import 'widget/mentor_app_bar.dart';
import 'widget/mentor_profile_section.dart';

class MentorDetails extends StatelessWidget {
  const MentorDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MentorAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [MentorProfileSection(), MentorCourseDetailsCard()],
        ),
      ),
    );
  }
}
