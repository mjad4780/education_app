import 'package:education/utility/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/failer_widget.dart';
import '../logic/cubit/profile_cubit.dart';
import '../ui/screan_profile.dart';

class GetProfileBlocBuilder extends StatelessWidget {
  const GetProfileBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) =>
          current is GetUserLoading ||
          current is GetUserFailure ||
          current is GetUserSuccess,
      builder: (_, state) {
        if (state is GetUserLoading) {
          return const LoadingWidget(child: ProfileBody());
        } else if (state is GetUserFailure) {
          return FailerWidget(
            messege: state.message,
            icon: Icons.error,
            onPressed: () => context.read<ProfileCubit>().getUser(),
          );
        } else if (state is GetUserSuccess) {
          return ProfileBody(user: state.user);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
