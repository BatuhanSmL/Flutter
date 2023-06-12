import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'firebase_options.dart';

class FirebaseNotificationService {
  late final FirebaseMessaging messaging;

  void settingNotification() async {
    await messaging.requestPermission(
      alert: true,
      sound: true,
      badge: true,
    );
  }

  void connectNotification() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    messaging = FirebaseMessaging.instance;
    messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
      badge: true,
    );

    settingNotification();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      Grock.snackBar(
        title: '${message.notification?.title}',
        description: '${message.notification?.body}',
        opacity: 0.8,
        position: SnackbarPosition.top,
        leading: message.notification?.android?.imageUrl == null
            ? null
            : Image.network('${message.notification?.android?.imageUrl}'),
        duration: Duration(seconds: 3),
      );
    });
  }

  static Future<void> backgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
  }
}
