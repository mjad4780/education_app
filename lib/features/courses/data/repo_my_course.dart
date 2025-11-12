import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:education/core/error/exceptions.dart';
import 'package:education/core/error/failures.dart';
import 'package:education/core/get_it/get_it.dart';
import 'package:education/core/helpers/connectivity_controller.dart';
import 'package:education/core/service/supabase/home_service/supabase_services_home.dart';
import 'package:education/features/home/data/model/response_home/course.dart';

class RepoMyCourse {
  final SupabaseServiceHome supabase;
  RepoMyCourse(
    this.supabase,
  );

  Future<Either<Failure, List<Course>>> getCompletedCourse() async {
    try {
      if (!getIt<ConnectivityController>().isConnected.value) {
        return left(ServerFailure('No internet connection'));
      }
      var response = await supabase.getCompletedCourse();
      if (response.result) {
        return right(response.data!);
      } else {
        return left(ServerFailure(response.messege));
      }
    } on CustomException catch (e) {
      log(e.message);
      return left(ServerFailure(e.message));
    }
  }
}
