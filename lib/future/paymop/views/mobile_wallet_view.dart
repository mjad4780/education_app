import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MobileWalletScreen extends StatelessWidget {
  final String redirectUrl;
  final VoidCallback onSuccess;
  final VoidCallback onError;
  const MobileWalletScreen({
    super.key,
    required this.redirectUrl,
    required this.onSuccess,
    required this.onError,
  });

  static InAppWebViewController? _appWebViewController;

  startPayment() {
    _appWebViewController?.loadUrl(
        urlRequest: URLRequest(url: WebUri(redirectUrl)));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: InAppWebView(
        initialSettings: InAppWebViewSettings(javaScriptEnabled: true),
        onWebViewCreated: (controller) {
          _appWebViewController = controller;
          startPayment();
        },
        onLoadStop: (controller, request) {
          if (request != null &&
              request.queryParameters.containsKey('success') &&
              request.queryParameters['success'] == 'true') {
            onSuccess();
          } else if (request != null &&
              request.queryParameters.containsKey('success') &&
              request.queryParameters['success'] == 'false') {
            onError();
          }
        },
      )),
    );
  }
}
