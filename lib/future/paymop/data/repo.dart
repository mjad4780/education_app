import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import 'models/reponse_body.dart';
import 'models/payment_data.dart';
import '../../../core/service/paymop/service_paymop.dart';

class RepoPaymop {
  final ServicePaymop dioHelper;

  RepoPaymop(this.dioHelper);

  Future<Either<Failure, String>> getAuthToken(PaymentData paymentData) async {
    try {
      var response = await dioHelper.getAuthToken(paymentData);
      if (response.result == true) {
        return right(response.messege);
      } else {
        return left(ServerFailure(response.messege));
      }
    } on CustomException catch (e) {
      log(e.message);
      return left(ServerFailure(e.message));
    }
  }

  Future<Either<Failure, String>> getOrderRegistrationId(
      ResponseBodys body) async {
    try {
      var response = await dioHelper.getOrderRegistrationId(body);
      if (response.result == true) {
        return right(response.messege);
      } else {
        log('dd${response.messege}');
        return left(ServerFailure(response.messege));
      }
    } on CustomException catch (e) {
      log(e.message);
      return left(ServerFailure(e.message));
    }
  }

  Future<Either<Failure, String>> payWithMobileWallet(
      String finalToken, String walletMobileNumber) async {
    try {
      var response =
          await dioHelper.payWithMobileWallet(finalToken, walletMobileNumber);
      if (response.result == true) {
        return right(response.messege);
      } else {
        return left(ServerFailure(response.messege));
      }
    } on CustomException catch (e) {
      log(e.message);
      return left(ServerFailure(e.message));
    }
  }
}
