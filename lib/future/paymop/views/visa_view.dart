import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class VisaScreen extends StatefulWidget {
  const VisaScreen({
    super.key,
    required this.finalToken,
    required this.onFinished,
    required this.onError,
  });
  final String finalToken;
  final VoidCallback onFinished;
  final VoidCallback onError;
  @override
  State<VisaScreen> createState() => _VisaScreenState();
}

class _VisaScreenState extends State<VisaScreen> {
  InAppWebViewController? _appWebViewController;
  @override
  void initState() {
    super.initState();
    // Initialize the WebView controller if necessary
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: null,
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
                  widget.onFinished();
                } else if (request != null &&
                    request.queryParameters.containsKey('success') &&
                    request.queryParameters['success'] == 'false') {
                  widget.onError();
                }
              },
            ),
          )),
    );
  }

  startPayment() {
    _appWebViewController?.loadUrl(
        urlRequest: URLRequest(
            url: WebUri(
                'https://accept.paymob.com/api/acceptance/iframes/891948?payment_token=${widget.finalToken}')));
  }
}
