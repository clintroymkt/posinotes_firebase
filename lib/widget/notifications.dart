import 'dart:developer';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:posinotes_sqlflite/services/utils.dart';

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
    NotificationWeekAndTime notificationSchedule) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 1,
      channelKey: 'scheduled_channel',
      title: '${Emojis.emotion_heart_with_ribbon} Add some water to your plant!',
      body: 'Water your plant regularly to keep it healthy.',
      notificationLayout: NotificationLayout.BigText,

    ),
    actionButtons: [
      NotificationActionButton(
        key: 'MARK_DONE',
        label: 'Mark Done',
      )
    ],
    schedule: NotificationCalendar(
      weekday: notificationSchedule.dayOfTheWeek,
      hour: notificationSchedule.timeOfDay.hour,
      minute: notificationSchedule.timeOfDay.minute,
      second: 0,
      millisecond: 0,
    ),

  );
  var test = notificationSchedule.dayOfTheWeek;
  var test2 = notificationSchedule.timeOfDay.hour;
  var test3 = notificationSchedule.timeOfDay.minute;

  debugPrint((test.toString()));
  debugPrint((test2.toString()));
  debugPrint((test3.toString()));

}