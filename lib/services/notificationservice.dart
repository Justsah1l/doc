import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('logo');

    InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {});
  }

  void Schedulenot(String title, String body) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max, priority: Priority.high);
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    await notificationsPlugin.periodicallyShow(
        0, title, body, RepeatInterval.daily, notificationDetails);
  }
}
