import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:posinotes_sqlflite/pages/dashboard_page.dart';
import 'package:posinotes_sqlflite/pages/notes_page.dart';
import 'package:posinotes_sqlflite/pages/quote_page.dart';
import 'package:posinotes_sqlflite/widget/notifications.dart';




Future main() async {
  //Initialize the awesome notifications widget
  AwesomeNotifications().initialize(
      'resource://drawable/res_notification_app_icon',
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic Notifications',
          defaultColor: Colors.teal,
          importance: NotificationImportance.High,
          channelShowBadge: true,
        ),
        NotificationChannel(
          channelKey: 'scheduled_channel',
          channelName: 'Scheduled Notifications',
          defaultColor: Colors.teal,
          locked: true,
          importance: NotificationImportance.High,
          channelShowBadge: true,
        ),
      ]
  );



  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  static final String title = 'Notes SQLite';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        themeMode: ThemeMode.light,
        theme: ThemeData(
          primaryColor: Colors.black,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
        ),
        home: DashboardPage(),
      );
}
