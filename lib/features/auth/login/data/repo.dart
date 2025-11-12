import 'package:dartz/dartz.dart';
import '../../../../core/error/error_handler_supabase.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/service/supabase/auth/auth_servieces.dart';

class LoginRepo {
  final AuthService _authService;

  LoginRepo(this._authService);
  Future<Either<Failure, String>> login(String email, String password) async {
    try {
      var response = await _authService.login(email, password);
      if (response.result == true) {
        return right(response.messege);
      } else {
        return left(ServerFailure(response.messege));
      }
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    }
  }

  Future<Either<Failure, String>> signInWithGoogle() async {
    try {
      var response = await _authService.signInWithGoogle();
      if (response.result == true) {
        return right(response.messege);
      } else {
        return left(ServerFailure(response.messege));
      }
    } catch (e) {
      return left(ServerFailure(ErrorHandlerSupabase.getErrorMessage(e)));
    }
  }
}
