import 'package:dartz/dartz.dart';
import 'package:education/core/error/exceptions.dart';
import 'package:education/core/error/failures.dart';
import 'package:education/core/get_it/get_it.dart';
import 'package:education/core/helpers/connectivity_controller.dart';
import 'package:education/core/service/supabase/home_service/supabase_services_home.dart';
import 'package:education/future/home/data/model/response_home/course.dart';

class RepoCoursesMentor {
  final SupabaseServiceHome _supabase;
  RepoCoursesMentor(
    this._supabase,
  );

  Future<Either<Failure, List<Course>>> getCoursesMentor(int mentorId) async {
    try {
      if (!getIt<ConnectivityController>().isConnected.value) {
        return left(ServerFailure('No internet connection'));
      }
      var response = await _supabase.getCoursesMentor(mentorId);
      if (response.result) {
        return right(response.data!);
      } else {
        return left(ServerFailure(response.messege));
      }
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    }
  }

  //:updateFollowers
  Future<Either<Failure, List<String>>> updateFollowers(
    int mentorId,
  ) async {
    try {
      if (!getIt<ConnectivityController>().isConnected.value) {
        return left(ServerFailure('No internet connection'));
      }
      var response = await _supabase.toggleFollower(
        mentorId,
      );
      if (response.result) {
        return right(response.data!);
      } else {
        return left(ServerFailure(response.messege));
      }
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    }
  }

  Future<Either<Failure, void>> canChatWithMentor(
    int mentorId,
  ) async {
    try {
      if (!getIt<ConnectivityController>().isConnected.value) {
        return left(ServerFailure('No internet connection'));
      }
      var response = await _supabase.canChatWithMentor(mentorId);
      if (response.result) {
        return right(null);
      } else {
        return left(ServerFailure(response.messege));
      }
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    }
  }
}
