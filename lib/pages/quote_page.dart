//import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:posinotes_sqlflite/model/quote.dart';
//import 'package:posinotes_sqlflite/network/quotes_network.dart';
import 'package:posinotes_sqlflite/pages/dashboard_page.dart';
import 'package:posinotes_sqlflite/widget/quote_widget.dart';
//import 'package:random_color/random_color.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({Key? key}) : super(key: key);

  @override
  _QuotesPageState createState() => _QuotesPageState();
}


class _QuotesPageState extends State<QuotesPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
 // final RandomColor _randomColor = RandomColor();

  @override
  void initState() {
    super.initState();
    // futureQuote = fetchQuote();
  }
  @override

 // late Future<List<Quote>> futureQuote;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Color(0XFF3BAAFF),
        title: Text("Quotes"),
        automaticallyImplyLeading: false,

      ),

      body: StreamBuilder(
       

        stream: _firestore.collection("qoutes").snapshots(),
        builder: (BuildContext context, AsyncSnapshot  snapshot){
          if(!snapshot.hasData) return _LoadingIndicator();

          return PageView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index){
              final document = snapshot.data.docs[index];
              return QuoteWidget(
                backgroundColor: Colors.redAccent,
                //_randomColor.randomColor(
                //  colorBrightness: ColorBrightness.dark
             //   ),
                quote: document['quote'],
                author: document['author'],

              );
            },
          );
        },
      ),
    );


  }






}

class _LoadingIndicator extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
