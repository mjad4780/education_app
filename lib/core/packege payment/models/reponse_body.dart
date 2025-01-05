import '../payment_data.dart';

enum PaymentMethod { visa, mobileWallet }

class ResponseBodys {
  final double price;
  final String paymentFirstToken;
  final PaymentData paymentData;
  final PaymentMethod selectedPaymentMethod;

  ResponseBodys(this.price, this.paymentFirstToken, this.paymentData,
      {this.selectedPaymentMethod = PaymentMethod.visa});
}
