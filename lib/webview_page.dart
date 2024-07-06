import 'dart:io'; // Import dart:io to use the Platform class
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_windows/webview_windows.dart';

const Color primaryColor = Colors.teal;

class WebViewPage extends StatefulWidget {
  final String url;

  const WebViewPage({Key? key, required this.url}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController _webViewController;
  late WebviewController _windowsWebViewController;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    } else if (Platform.isWindows) {
      _initializeWindowsWebView();
    }
  }

  Future<void> _initializeWindowsWebView() async {
    _windowsWebViewController = WebviewController();
    await _windowsWebViewController.initialize();
    await _windowsWebViewController.setBackgroundColor(Colors.transparent);
    _windowsWebViewController.url.listen((url) {
      print('WebView is loading: $url');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView'),
        backgroundColor: primaryColor,
      ),
      body: Platform.isAndroid
          ? WebView(
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) {
                _webViewController = controller;
              },
            )
          : Platform.isWindows
              ? FutureBuilder<void>(
                  future: _initializeWindowsWebView(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      _windowsWebViewController.loadUrl(widget.url);
                      return Webview(_windowsWebViewController);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                )
              : Center(
                  child: Text('Unsupported platform'),
                ),
    );
  }
}
