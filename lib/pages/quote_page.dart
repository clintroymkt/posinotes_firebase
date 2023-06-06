//import 'dart:developer';



import 'package:flutter/foundation.dart';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:posinotes_sqlflite/model/quote.dart';
//import 'package:posinotes_sqlflite/network/quotes_network.dart';
import 'package:posinotes_sqlflite/services/utils.dart';
import 'package:posinotes_sqlflite/widget/notifications.dart';
// import 'package:posinotes_sqlflite/widget/notifications.dart';
import 'package:posinotes_sqlflite/widget/quote_widget.dart';
import 'package:workmanager/workmanager.dart';
import 'package:random_color/random_color.dart';
import '../main.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({Key? key}) : super(key: key);

  @override
  _QuotesPageState createState() => _QuotesPageState();
}

dynamic notification_data = "";
dynamic notification_data1 = "";

class _QuotesPageState extends State<QuotesPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    // futureQuote = fetchQuote();
  }
  RandomColor _randomColor = RandomColor();

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
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) return _LoadingIndicator();

          var random = new Random();
          var min = 0;
          var max = snapshot.data.docs.length;
          num result = min + random.nextInt(max - min);

          final documents = snapshot.data.docs..shuffle();

          notification_data = documents[result];
          notification_data1 = documents[result];



          return Scaffold(
            body: PageView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                var doc = documents[index];
                return QuoteWidget(
                  backgroundColor:
                      //Colors.redAccent,
                  _randomColor.randomColor(
                      colorBrightness: ColorBrightness.dark
                  ),
                  quote: doc['quote'],
                  author: doc['author'],
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // Add your onPressed code here!
                Workmanager().registerPeriodicTask(
                    simplePeriodicTask, simplePeriodic1HourTask,
                    frequency: Duration(minutes: 10));
              },
              backgroundColor: Colors.green,
              child: const Icon(Icons.notification_add),
            ),

          );
        },
      ),


    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
