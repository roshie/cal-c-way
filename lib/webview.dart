import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WebViewDemo();
  }
}

class _WebViewDemo extends State<WebViewDemo> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: 'https://roshie.github.io/explorechennai/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          onPageStarted: (String url) {
            showAlertDialog(context);
          },
          onPageFinished: (String url) {
            count++;
            if (count == 2){
              Navigator.of(context).pop();
            }
          },
          gestureNavigationEnabled: true,
        );
      }),
    );
  }

  showAlertDialog(var context) {
    var alertDialog = AlertDialog(
      title: Text("Loading..."),
      content: LinearProgressIndicator(),
    );

    showDialog(context: context, builder: (context) => alertDialog);
  }
}