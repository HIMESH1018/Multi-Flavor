import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:multi_flavour/utills/custom_colors.dart';
import 'package:multi_flavour/utills/firebase_api.dart';

import 'app_env.dart';
import 'home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  AppEnvironment.setupEnv(Environment.red);
  ///Firebase  Initialize
  await Firebase.initializeApp(
      options: const FirebaseOptions
        (
          apiKey: "AIzaSyAYGYgAsvk702d_wfP_U6EZV-hXoWbiu3k",
          appId: "1:552500699949:android:d906a0f17a66afc02be9a4",
          messagingSenderId: "552500699949",
          projectId: "test-flavors-31994"
      ));

  ///Firebase Cloud Messaging Initialize
  await FirebaseApi().initializeNotification();

  ///Firebase Cloud Messaging Background Message Handler
  FirebaseMessaging.onBackgroundMessage(messageHandler);


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor:
        AppEnvironment.theme.cardColor
        ),
        useMaterial3: true,
      ),
      home: MyHomePage(title: (AppEnvironment.appTitle ?? "")),
    );
  }
}

///Need to be a Top Level Function to handle background message
Future<void> messageHandler(RemoteMessage message) async {
  print('background message ${message.notification!.body}');
}


