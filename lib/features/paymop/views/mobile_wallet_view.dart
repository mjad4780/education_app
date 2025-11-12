import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MobileWalletScreen extends StatefulWidget {
  final String redirectUrl;
  final VoidCallback onSuccess;
  final VoidCallback onError;
  const MobileWalletScreen({
    super.key,
    required this.redirectUrl,
    required this.onSuccess,
    required this.onError,
  });

  @override
  State<MobileWalletScreen> createState() => _MobileWalletScreenState();
}

class _MobileWalletScreenState extends State<MobileWalletScreen> {
  InAppWebViewController? _appWebViewController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: InAppWebView(
            initialSettings: InAppWebViewSettings(javaScriptEnabled: true),
            onWebViewCreated: (controller) {
              _appWebViewController = controller;
              startPayment();
            },
            onLoadStop: (controller, request) {
              if (request != null &&
                  request.queryParameters.containsKey('success') &&
                  request.queryParameters['success'] == 'true') {
                widget.onSuccess();
              } else if (request != null &&
                  request.queryParameters.containsKey('success') &&
                  request.queryParameters['success'] == 'false') {
                widget.onError();
              }
            },
          ),
        ),
      ),
    );
  }

  startPayment() {
    _appWebViewController?.loadUrl(
        urlRequest: URLRequest(
            url: WebUri(
      widget.redirectUrl,
    )));
  }
}
