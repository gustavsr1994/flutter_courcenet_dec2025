import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class ConfigNotification {
  AwesomeNotifications _awesomeNotifications = AwesomeNotifications();

  void initialNotification() async {
    getToken();
    NotificationChannel notificationChannel = NotificationChannel(
      channelKey: 'notif',
      channelName: 'notif',
      channelDescription: 'notif',
      importance: NotificationImportance.High,
    );
    await _awesomeNotifications.initialize(null, [
      notificationChannel,
    ], debug: true);
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(alert: true, sound: true, badge: true);
    FirebaseMessaging.onMessage.listen(
      (event) => showNotification(
        event.notification!.title ?? '',
        event.notification!.body ?? '',
      ),
    );

    FirebaseMessaging.onBackgroundMessage(
      (message) => showNotification(
        message.notification!.title ?? '',
        message.notification!.body ?? '',
      ),
    );
  }

  void getToken() async {
    try {
      var token = await FirebaseMessaging.instance.getToken();
      print("Token: $token");
    } catch (e) {
      print("Error Notif: ${e.toString()}");
      throw Exception(e.toString());
    }
  }

  Future showNotification(String title, String message) async {
    await _awesomeNotifications.createNotification(
      content: NotificationContent(
        id: -1,
        channelKey: 'notif',
        title: title,
        body: message,
      ),
    );
  }

  Future<bool> requestPermissionNotification() async {
    return await _awesomeNotifications.requestPermissionToSendNotifications();
  }
}
