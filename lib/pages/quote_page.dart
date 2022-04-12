//import 'dart:developer';

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:posinotes_sqlflite/model/quote.dart';
//import 'package:posinotes_sqlflite/network/quotes_network.dart';
import 'package:posinotes_sqlflite/services/utils.dart';
import 'package:posinotes_sqlflite/widget/notifications.dart';
// import 'package:posinotes_sqlflite/widget/notifications.dart';
import 'package:posinotes_sqlflite/widget/quote_widget.dart';
import 'package:random_color/random_color.dart';


class QuotesPage extends StatefulWidget {
  const QuotesPage({Key? key}) : super(key: key);

  @override
  _QuotesPageState createState() => _QuotesPageState();
}

dynamic notification_data = "";
dynamic notification_data1 = "";

class _QuotesPageState extends State<QuotesPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final RandomColor _randomColor = RandomColor();

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

          var random = new Random();
          var min =0;
          var max = snapshot.data.docs.length;
          num result = min + random.nextInt(max - min);

          final documents = snapshot.data.docs..shuffle();

          notification_data = documents[result];
          notification_data1 = documents[result];


          createWaterReminderNotification(notification_data1['quote'],notification_data1['author']);
          debugPrint( 'the quote is ' + notification_data['quote']);
          debugPrint( 'the author is ' + notification_data['author']);

          return PageView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index){
              var doc = documents[index];
              return QuoteWidget(
                backgroundColor:
                //Colors.redAccent,
                _randomColor.randomColor(
                  colorBrightness: ColorBrightness.light
                ),
                quote: doc['quote'],
                author: doc['author'],

              );
            },
          );

        },
      ),

      // floatingActionButton:FloatingActionButton(
      //   backgroundColor: Color(0XFF3BAAFF),
      //   child: Icon(Icons.doorbell_outlined),
      //   onPressed: () async {
      //     debugPrint('here');
      //     NotificationWeekAndTime? pickedSchedule =
      //     await pickSchedule(context);
      //     debugPrint('here 2');
      //     if (pickedSchedule != null) {
      //       debugPrint('here 3');
      //       createWaterReminderNotification(pickedSchedule,notification_data['author'],notification_data['quote']);
      //     }
      //   },
      // ) ,
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
