import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//options.queryParameters[]

    // options.headers['Accept-Language'] = "en";
    // options.headers['Content-Type'] = "application/x-www-form-urlencoded";
    options.headers['Content-Type'] = "application/json";
    // options.headers['Stripe-Version'] = "2024-06-20";
    // options.headers['Authorization'] = 'Bearer ${ApiConstants.apikey}';

    super.onRequest(options, handler);
  }
}
