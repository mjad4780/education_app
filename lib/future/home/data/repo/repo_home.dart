import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:education/core/error/exceptions.dart';
import 'package:education/core/error/failures.dart';
import 'package:education/core/service/home_service/supabase_services_Home.dart';
import 'package:education/future/home/data/model/response_home/response_home.dart';

class RepoHome {
  final SupabaseServiceHome _supabase;

  RepoHome(this._supabase);

  Future<Either<Failure, ResponseHome>> getHomeData() async {
    try {
      var response = await _supabase.getHomeData();
      return right(response);
    } on CustomException catch (e) {
      log(e.message);
      return left(ServerFailure(e.message));
    }
  }
}
