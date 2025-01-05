import 'package:dio/dio.dart';

import '../../success/return_response_service.dart';
import '../models/reponse_body.dart';
import '../payment_data.dart';

class DioHelper {
  final Dio dio;

  DioHelper(this.dio);

  // Future<Response> postData(
  //     {required String url, Map<String, dynamic>? data}) async {
  //   return await dio.post(url, data: data);
  // }

  Future<ResponseService> getAuthToken(PaymentData body) async {
    try {
      final response = await dio.post(
        'https://accept.paymob.com/api/auth/tokens',
        data: {
          "api_key": body.apiKey,
        },
      );
      return ResponseService(true, response.data['token']);
    } catch (error) {
      return ResponseService(false, error.toString());
    }
  }

  Future<ResponseService> getOrderRegistrationId(ResponseBodys body) async {
    try {
      final response = await dio.post(
        'https://accept.paymob.com/api/ecommerce/orders',
        data: {
          "auth_token": body.paymentFirstToken,
          "delivery_needed": "false",
          "amount_cents": (body.price * 100).toString(),
          "currency": "EGP",
          "items": [],
        },
      );

      ResponseService responseService =
          await getPaymentRequest(body, response.data['id'].toString());
      if (responseService.result == true) {
        return ResponseService(true, responseService.messege);
      } else {
        return ResponseService(false, responseService.messege);
      }
    } catch (error) {
      return ResponseService(false, error.toString());
    }
  }

  Future<ResponseService> getPaymentRequest(
    ResponseBodys body,
    String paymentOrderId,
  ) async {
    final requestData = {
      "auth_token": body.paymentFirstToken,
      "amount_cents": (body.price * 100).toString(),
      "expiration": 3600,
      "order_id": paymentOrderId,
      "billing_data": {
        "apartment": "NA",
        "email": body.paymentData.userData?.email ?? 'NA',
        "floor": "NA",
        "first_name": body.paymentData.userData?.name ?? 'NA',
        "street": "NA",
        "building": "NA",
        "phone_number": body.paymentData.userData?.phone ?? 'NA',
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": body.paymentData.userData?.lastName ?? 'NA',
        "state": "NA",
      },
      "currency": "EGP",
      "integration_id": body.selectedPaymentMethod == PaymentMethod.visa
          ? body.paymentData.integrationCardId
          : body.paymentData.integrationMobileWalletId,
      "lock_order_when_paid": "false",
    };

    try {
      final response = await dio.post(
        'https://accept.paymob.com/api/acceptance/payment_keys',
        data: requestData,
      );

      return ResponseService(true, response.data['token']);
    } catch (error) {
      return ResponseService(false, error.toString());
    }
  }

  Future<ResponseService> payWithMobileWallet(
      String finalToken, String walletMobileNumber) async {
    final paymentData = {
      "source": {
        "identifier": walletMobileNumber,
        "subtype": "WALLET",
      },
      "payment_token": finalToken,
    };

    try {
      final response = await dio.post(
        'https://accept.paymob.com/api/acceptance/payments/pay',
        data: paymentData,
      );

      if (response.data.containsKey('redirect_url')) {
        return ResponseService(true, response.data['redirect_url'].toString());
      } else {
        return ResponseService(false, "No redirect URL found");
      }
    } catch (error) {
      return ResponseService(false, error.toString());
    }
  }
}
