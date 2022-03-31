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
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

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
        body: WebView(
          initialUrl: widget.urll,
        ));
  }
}
