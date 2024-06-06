
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {

  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initializeNotification() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print("FCM Token: $fCMToken");

    receivedOnMessages();
  }

  Future<void> receivedOnMessages()async{
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message recieved");
      print(event.notification?.body ?? "No message");
      //GlobalAlertDialogs().simpleAlertDialog(navigatorKey.currentContext!,'Simple Notification',event.notification?.body ?? "No message");
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Message clicked!');
    });
  }


}