import 'package:flutter/material.dart';
import 'package:posinotes_sqlflite/widget/theme_text.dart';

class QuoteWidget extends StatelessWidget {
  final Color backgroundColor;
  final String quote, author;

  const QuoteWidget(
      {Key? key,
      required this.backgroundColor,
      required this.quote,
      required this.author})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(),
      color: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0),
                child: Text(
                  quote,
                  style: Themetext.headline,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                author,
                style: Themetext.subhead,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
