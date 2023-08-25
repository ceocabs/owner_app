import 'dart:convert';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class PushNotificationsManager {
  PushNotificationsManager._();

  factory PushNotificationsManager() => _instance;

  static final PushNotificationsManager _instance =
      PushNotificationsManager._();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'customer_channel 2',
    'Customer Update',
    description: 'channel_description',
    importance: Importance.max,
    enableVibration: true,
    showBadge: true,
  );

  Future<void> init() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      sound: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
    );

    if (Platform.isIOS) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(alert: true, badge: true, sound: true);
    } else {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);
    }

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);

       _firebaseMessaging.getToken().then((String? token) {
         print(token.toString() + " token..........");
    //  appDB.fcmToken = token!;
     // print("Push Messaging token: ${appDB.fcmToken}");
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        _showNotificationWithDefaultSound(message);
      }
    });

    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      print("====================initialMessage=======================");
      printRemoteMessage(initialMessage);
    }

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onBackgroundMessage(_showNotificationWithDefaultSound);

    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("====================onMessageOpenedApp=======================");
      printRemoteMessage(message);
      updateNavigation(message);
    });

    var android = new AndroidInitializationSettings('mipmap/ic_launcher');
    var ios = new IOSInitializationSettings();
    var platform = new InitializationSettings(android: android, iOS: ios);
    flutterLocalNotificationsPlugin.initialize(
      platform,
      onSelectNotification: (payload) {
        print(
            "====================onSelectNotification=======================");
        print(payload);
        updateNavigation(jsonDecode(payload!));
      },
    );
  }

  Future _showNotificationWithDefaultSound(RemoteMessage payload) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'customer_channel 2', 'Customer Update',
        channelDescription: 'channel_description',
        importance: Importance.max,
        priority: Priority.high,
        ongoing: false,
        styleInformation: BigTextStyleInformation(''),
        playSound: true,
        enableVibration: true,
        autoCancel: true);

    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
        presentAlert: true, presentBadge: true, presentSound: true);

    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    var notification = payload.notification;
    var data = payload.data;
    print(payload.notification);
    print(
        "====================_showNotificationWithDefaultSound=======================");
    printRemoteMessage(payload);

    await flutterLocalNotificationsPlugin.show(
      0,
      notification?.title,
      notification?.body,
      platformChannelSpecifics,
      payload: jsonEncode(payload.data),
    );
    // updateNavigation(payload);
  }
}

const String pollPush = "poll_push";
const String storyPush = "story_push";
const String quizPush = "quiz_push";

void updateNavigation(/*Map<String, dynamic> data*/ RemoteMessage data) {
  print("===============updateNavigation=================");
  //print(jsonEncode(data));
  print(data.notification!.title.toString() + " title..........");
  print(data.notification!.body.toString() + " body..........");
  print(data.data.toString() + " data..........");
  print(data.data['orderId'].toString() + " order id..........");
//  print(data.notification!.id.toString() + " data..........");
  print(data.notification!.titleLocArgs.toString() + " titleLocArgs..........");
  print(data.notification!.bodyLocArgs.toString() + " bodyLocArgs..........");

  switch (data.data['Type'].toString()) {
    case "Your order placed":
      print("order place notification push......");
      /*Get.to(() => OrderDetails(
            orderId: int.parse(data.data['orderId']),
          ));*/
      break;
    case "Product Status Updated":
      print("order update notification push......");

      break;
    case "New Arrival":
      print("order update notification push......");

      break;
    case "Wallet added please wait for verification":
      print("order update notification push......");

      break;
  }

  // print(data["title"]);
  // print(data["action_id"]);
}

printRemoteMessage(RemoteMessage message) {
  // print("Notification_TITLE: ${jsonEncode(message.notification)}");
  // print("Notification_TITLE: ${jsonEncode(message)}");
  // print("Notification_TITLE: ${jsonEncode(message.notification!.title)}");
  //print("Notification_BODY: ${jsonEncode(message.notification!.body)}");
  //print("Data: ${jsonEncode(message.data)}");
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print('Handling a background message ${message.messageId}');
  updateNavigation(message);
}
