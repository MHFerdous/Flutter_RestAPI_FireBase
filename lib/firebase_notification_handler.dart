import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotificationHandler {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initialization() async {
    await firebaseMessaging.requestPermission(
      sound: true,
      badge: true,
      alert: true,
      criticalAlert: false,
      provisional: false,
      carPlay: false,
    );

    RemoteMessage? message =
        await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      messageHandler(message);
    }
    FirebaseMessaging.onMessage.listen(messageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(messageHandler);
    FirebaseMessaging.onBackgroundMessage(firebaseMessingBackgroundHandler);
  }

  Future<void> messageHandler(RemoteMessage message) async {
    print(message.data);
    print(message.notification?.body ?? 'Empty body');
    print(message.notification?.title ?? 'Empty title');
  }

  Future<String?> getToken() async {
    final String? token = await firebaseMessaging.getToken();
    print(token);
    return token;
  }

  void onTokenRefresh() {
    firebaseMessaging.onTokenRefresh.listen(
      (token) {
        print('Send to api $token');
      },
    );
  }

  Future<void> subscribeToTopic(String topicName) async {
    await firebaseMessaging.subscribeToTopic(topicName);
  }

  Future<void> unsubscribeToTopic(String topicName) async {
    await firebaseMessaging.unsubscribeFromTopic(topicName);
  }
}

Future<void> firebaseMessingBackgroundHandler(RemoteMessage message) async {
  print(message.data);
  print(message.notification?.body ?? 'Empty body');
  print(message.notification?.title ?? 'Empty title');
}
