import 'package:education/core/get_it/get_it.dart';
import 'package:education/future/home/cubit/home_cubit.dart';
import 'package:education/future/home/widget/home_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScrean extends StatelessWidget {
  const HomeScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..getData(),
      child: const HomeBlocBuilder(),
    );
  }
}
