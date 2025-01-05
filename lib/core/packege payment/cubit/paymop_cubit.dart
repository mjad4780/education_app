import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:education/core/packege%20payment/data/repo.dart';
import 'package:flutter/material.dart';

import '../models/reponse_body.dart';
import '../payment_data.dart';

part 'paymop_state.dart';

class PaymopCubit extends Cubit<PaymopState> {
  PaymopCubit(this._repoPaymop) : super(PaymopInitial());
  final RepoPaymop _repoPaymop;
  final PaymentData paymentData = PaymentData();
  ResponseBodys? responseBodys;
  PaymentMethod selectedPaymentMethod = PaymentMethod.visa;
  String redirectUrl = "";
  String paymentFirstToken = '';
  String paymentOrderId = '';
  String finalToken = '';

  final TextEditingController walletMobileNumber = TextEditingController();

  void setPaymentMethod(PaymentMethod method) {
    selectedPaymentMethod = method;

    emit(PaymentMethodChanged(method));
  }

  Future<void> getAuthToken() async {
    emit(PaymentAuthLoading());
    final result = await _repoPaymop.getAuthToken(paymentData);
    result.fold(
      (failure) => emit(PaymentAuthFailure(failure.message)),
      (success) {
        paymentFirstToken = success;
        emit(PaymentAuthSuccess());
      },
    );
  }

  Future<void> getOrderRegistrationId(double price) async {
    responseBodys = ResponseBodys(price, paymentFirstToken, paymentData,
        selectedPaymentMethod: selectedPaymentMethod);
    emit(PaymentAuthLoading());
    final result = await _repoPaymop.getOrderRegistrationId(responseBodys!);
    result.fold(
        (failure) => emit(
              PaymentRequestFailure(failure.message),
            ), (success) {
      log(success);
      finalToken = success;
      emit(
        PaymentRequestSuccess(),
      );
    });
  }

  Future<void> payWithMobileWallet() async {
    emit(PaymentAuthLoading());
    final result = await _repoPaymop.payWithMobileWallet(
        finalToken, walletMobileNumber.text);
    result.fold(
      (failure) => emit(
        PaymentMobileWalletFailure(failure.message),
      ),
      (success) => emit(
        PaymentMobileWalletSuccess(),
      ),
    );
  }
}
