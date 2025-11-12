import 'package:dartz/dartz.dart';
import 'package:education/features/profile/data/model/profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/error/error_handler_supabase.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/service/supabase/auth/auth_servieces.dart';
import '../../../../core/service/supabase/home_service/supabase_services_home.dart';

class ProfileRepoImpl {
  final SupabaseServiceHome supabaseServices;
  final AuthService authService;

  ProfileRepoImpl(this.supabaseServices, this.authService);

  Future<Either<Failure, void>> logout() async {
    try {
      final user = await authService.logout();

      if (user.result == true) {
        return right(null);
      } else {
        return left(ServerFailure(user.messege));
      }
    } catch (e) {
      return left(ServerFailure(ErrorHandlerSupabase.getErrorMessage(e)));
    }
  }

  Future<Either<Failure, User?>> getUser() async {
    try {
      final user = await supabaseServices.getUser();

      if (user.result == true) {
        return right(user.data);
      } else {
        return left(ServerFailure(user.messege));
      }
    } catch (e) {
      return left(ServerFailure(ErrorHandlerSupabase.getErrorMessage(e)));
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
    } catch (e) {
      return left(ServerFailure(ErrorHandlerSupabase.getErrorMessage(e)));
    }
  }
}
