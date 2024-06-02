import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagingService {
  static String? fcmToken; // Variable to store the FCM token

  static final MessagingService _instance = MessagingService._internal();

  factory MessagingService() => _instance;

  MessagingService._internal();

  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future<void> init(BuildContext context) async {
    // Requesting permission for notifications
    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    debugPrint(
        'User granted notifications permission: ${settings.authorizationStatus}');

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Listening for incoming messages while the app is in the foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('Got a message whilst in the foreground!');
      debugPrint('Message data: ${message.notification!.title.toString()}');

      if (message.notification != null) {
        if (message.notification!.title != null &&
            message.notification!.body != null) {
          final notificationData = message.data;
          final notificationDatas = message.notification;
          final screen = notificationData['screen'];
          final imageUrl = notificationData['image'];
          // Showing an alert dialog when a notification is received (Foreground state)
          Get.snackbar('${message.notification!.title}',
              "${message.notification!.body.toString()}",
              colorText: Colors.black87, backgroundColor: Colors.white);
          // var snackBar =
          //     SnackBar(content: Text('${message.notification!.body}'));
          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
          // showCupertinoDialog(
          //   context: context,
          //   builder: (BuildContext context) {
          //     return CupertinoAlertDialog(
          //       title: Container(
          //           alignment: Alignment.centerLeft,
          //           child: Text(message.notification!.title!)),
          //       content: Column(
          //         children: [
          //           Container(
          //               alignment: Alignment.centerLeft,
          //               child: Text(message.notification!.body!)),
          //           SizedBox(
          //             height: 10,
          //           ),
          //     //      if (imageUrl != "") Image.network(imageUrl),
          //         ],
          //       ),
          //       actions: [
          //         CupertinoDialogAction(
          //           onPressed: () => Navigator.of(context).pop(),
          //           child: const Text('Ok'),
          //         ),
          //       ],
          //     );
          //   },
          // );
        }
      }
    });

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        _handleNotificationClick(context, message);
      }
    });

    // Handling a notification click event when the app is in the background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint(
          'onMessageOpenedApp: ${message.notification!.title.toString()}');
      _handleNotificationClick(context, message);
    });
  }

  // Handling a notification click event by navigating to the specified screen
  void _handleNotificationClick(BuildContext context, RemoteMessage message) {
    final notificationData = message.data;

    if (notificationData.containsKey('screen')) {
      final screen = notificationData['screen'];
      Navigator.of(context).pushNamed(screen);
    }
  }
}

// Handler for background messages
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  debugPrint('Handling a background message: ${message.notification!.title}');
}

/*
const firebaseConfig = {
  apiKey: "AIzaSyANmsfrrrmdgu3WKlShSaSDQfZGFOmirqs",
  authDomain: "chatuser-f2649.firebaseapp.com",
  databaseURL: "https://chatuser-f2649-default-rtdb.firebaseio.com",
  projectId: "chatuser-f2649",
  storageBucket: "chatuser-f2649.appspot.com",
  messagingSenderId: "636381401881",
  appId: "1:636381401881:web:cecf3ab03bf28cd4572b88",
  measurementId: "G-746Q9BT4D5"
};*/
