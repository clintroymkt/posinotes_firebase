import'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationApi {
  static final _notification = FlutterLocalNotificationsPlugin();
  static Future _notificationDetails() async{
    return NotificationDetails(
         android: AndroidNotificationDetails(
           'channel id',
           'channel name',
           'channel description'  ,
           importance: Importance.max,
           icon: "@mipmap/ic_launcher",
         ),
         iOS: IOSNotificationDetails(),
    );
  }

  static Future init({bool initSheduled = false}) async{
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final iOS = IOSInitializationSettings();
    final settings = InitializationSettings(android: android, iOS: iOS);
    await _notification.initialize(
      settings,
      onSelectNotification: (payload) async {},
    );
  }


  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,

  })  async => _notification.show(
    id,
    title,
    body,
    await _notificationDetails(),
    payload: payload,
  );
}




