part of 'paymop_cubit.dart';

sealed class PaymopState {}

final class PaymopInitial extends PaymopState {}

class PaymentAuthLoading extends PaymopState {}

class PaymentAuthSuccess extends PaymopState {}

class PaymentAuthFailure extends PaymopState {
  final String error;
  PaymentAuthFailure(this.error);
}

/////////////////PaymentRequest///////////////

class PaymentRequestLoading extends PaymopState {}

class PaymentRequestSuccess extends PaymopState {}

class PaymentRequestFailure extends PaymopState {
  final String error;
  PaymentRequestFailure(this.error);
}

//////////mobile//////////
class PaymentMobileWallLoading extends PaymopState {}

class PaymentMobileWalletSuccess extends PaymopState {
  final String redirectUrl;
  PaymentMobileWalletSuccess(this.redirectUrl);
}

class PaymentMobileWalletFailure extends PaymopState {
  final String error;
  PaymentMobileWalletFailure(this.error);
}

/////////////vise and  mobile
class PaymentMethodChanged extends PaymopState {
  final PaymentMethod method;
  PaymentMethodChanged(this.method);
}
