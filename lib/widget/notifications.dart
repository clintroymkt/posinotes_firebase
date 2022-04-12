import 'dart:developer';
import 'dart:math';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:posinotes_sqlflite/services/utils.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

dynamic notification_data = "";
String title = "";
String body = "";
Future<void> createPlantFoodNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: createUniqueId(),
      channelKey: 'basic_channel',
      title:
      '${Emojis.money_money_bag + Emojis.plant_cactus} Buy Plant Food!!!',
      body: 'Florist at 123 Main St. has 2 in stock.',
      bigPicture: 'asset://assets/notification_map.png',
      notificationLayout: NotificationLayout.BigPicture,
    ),
  );
}


//scheduled notifications
Future<void> createWaterReminderNotification(
    String title,  String Body
    ) async {
  String localTimeZone = await AwesomeNotifications().getLocalTimeZoneIdentifier();
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 1,
      channelKey: 'scheduled_channel',
      title: '${Emojis.emotion_heart_with_ribbon} ${Body}',
      body: '${title}',
      notificationLayout: NotificationLayout.BigText,

    ),

    actionButtons: [
      NotificationActionButton(
        key: 'MARK_DONE',
        label: 'Tap for more',
      )
    ],
    schedule: NotificationInterval(
      interval: 21600,
      timeZone: localTimeZone,
      allowWhileIdle: true,
      repeats: true,
    ),

  );
  debugPrint(title);
  debugPrint(body);
}


