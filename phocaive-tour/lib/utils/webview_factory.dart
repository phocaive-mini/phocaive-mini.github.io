import 'package:webview_flutter/webview_flutter.dart';

class WebViewFactory {
  static WebViewController create(String url) {
    return WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(url));
  }
}