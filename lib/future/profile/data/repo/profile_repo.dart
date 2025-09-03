import 'package:dartz/dartz.dart';
import 'package:education/future/profile/data/model/profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/service/supabase/home_service/supabase_services_home.dart';

class ProfileRepoImpl {
  final SupabaseServiceHome supabaseServices;

  ProfileRepoImpl(this.supabaseServices);

  Future<Either<Failure, User?>> getUser() async {
    try {
      final user = await supabaseServices.getUser();

      if (user.result == true) {
        return right(user.data);
      } else {
        return left(ServerFailure(user.messege));
      }
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    }
  }

  Future<Either<Failure, User>> updateUserAndImageProfile(
      ProfileModel profileModel) async {
    try {
      final updatedUser = await supabaseServices.updateUserAndImageProfile(
          profileModel: profileModel);
      if (updatedUser.result == false) {
        return left(ServerFailure(updatedUser.messege));
      } else {
        return right(updatedUser.data!);
      }
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    }
  }
}
