import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/awishapp/generatedandroidlarge1widget/GeneratedAndroidLarge1Widget.dart';
import 'package:flutterapp/awishapp/generatedformfieldwidget/GeneratedFormfieldWidget.dart';
import 'package:flutterapp/awishapp/generatedline1widget/GeneratedLine1Widget.dart';
import 'package:flutterapp/service.dart';
import 'package:grock/grock.dart';
import 'firebase_options.dart';
import 'package:http/http.dart' as http;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseMessaging.instance.subscribeToTopic('YES');
  final token = await FirebaseMessaging.instance.getToken();
  print(token);
  FirebaseMessaging.onBackgroundMessage(
      FirebaseNotificationService.backgroundMessage);
  runApp(AWishApp());
}

class AWishApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: Grock.navigationKey,
      scaffoldMessengerKey: Grock.scaffoldMessengerKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/GeneratedAndroidLarge1Widget',
      routes: {
        '/GeneratedAndroidLarge1Widget': (context) =>
            GeneratedAndroidLarge1Widget(),
        '/GeneratedFormfieldWidget': (context) => GeneratedFormfieldWidget(),
        '/GeneratedLine1Widget': (context) => GeneratedLine1Widget(),
      },
    );
  }
}
