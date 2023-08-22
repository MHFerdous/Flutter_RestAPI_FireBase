import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotificationHandler {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initialization() async {
    await firebaseMessaging.requestPermission(
      sound: true,
      badge: true,
      alert: true,
      criticalAlert: true,
    );
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        print('This is from on message');
        print(message.data);
        print(message.notification?.body ?? 'Empty body');
        print(message.notification?.title ?? 'Empty title');
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print('This is from opened app');
        print(message.data);
        print(message.notification?.body ?? 'Empty body');
        print(message.notification?.title ?? 'Empty title');
      },
    );
  }
}
