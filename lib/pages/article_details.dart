import 'dart:io';
import 'package:flutter/material.dart';
import 'package:posinotes_sqlflite/model/article_model.dart';
import 'package:webview_flutter/webview_flutter.dart';


class ArticlePage extends StatefulWidget {
  final String urll;
  const ArticlePage({Key? key, required this.urll}) : super(key: key);

  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<ArticlePage> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.

  }
  var controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://flutter.dev'));

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Color(0XFF3BAAFF),
          automaticallyImplyLeading: false,
          title: Text(

            'PosiNotes Reader Mode',
            style: TextStyle(fontSize: 15.00),
          ),
          actions: [Icon(Icons.search), SizedBox(width: 12)],
        ),
        body: WebViewWidget(controller: controller),);
  }
}
