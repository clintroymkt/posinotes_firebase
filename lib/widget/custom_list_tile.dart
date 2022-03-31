import 'package:flutter/material.dart';
import 'package:posinotes_sqlflite/model/article_model.dart';
import 'package:posinotes_sqlflite/pages/article_details.dart';

Widget customListTile(Article article, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticlePage(urll: article.url.toString())));
    },
    child: Container(
      margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [BoxShadow(color: Colors.black, blurRadius: 3.0)]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(article.urlToImage),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(5.0)),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            padding: EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Text(
              article.source.name,
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            article.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
        ],
      ),
    ),
  );
}
