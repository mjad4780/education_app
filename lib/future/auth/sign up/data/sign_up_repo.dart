import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:education/future/auth/sign%20up/data/model/sign_up_reqest_body.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/service/auth/auth_servieces.dart';

class SignUpRepo {
  final AuthService _authService;

  SignUpRepo(this._authService);
  Future<Either<Failure, String>> signedUploadImage(File file) async {
    try {
      var image = await _authService.signedUploadImage(file);
      if (image.result == true) {
        return right(image.messege);
      } else {
        return left(ServerFailure(image.messege));
      }
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    }
  }

  Future<Either<Failure, String>> signUp(SignUpReqestBody body) async {
    try {
      var response = await _authService.register(body);

      if (response.result == true) {
        return right(response.messege);
      } else {
        return left(ServerFailure(response.messege));
      }
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    }
  }
}
