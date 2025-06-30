import 'package:education/core/get_it/get_it.dart';
import 'package:education/future/mentor%20detalais/logic/cubit/mentor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/data/model/response_home/mentor.dart';
import 'widget/course_details_card.dart';
import 'widget/mentor_app_bar.dart';
import 'widget/mentor_profile_section.dart';

class MentorDetails extends StatelessWidget {
  const MentorDetails({super.key, required this.mentor});
  final Mentor mentor;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<MentorCubit>(),
        child: Scaffold(
          appBar: const MentorAppBar(),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: MentorProfileSection(
                  mentor: mentor,
                ),
              ),
              SliverToBoxAdapter(
                child: MentorCourseDetailsCard(
                  mentor: mentor,
                ),
              ),
            ],
          ),
        ));
  }
}
