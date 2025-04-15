import 'dart:io';
import 'package:app_settings/app_settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import '../../views/screens/firebase_messaging/fetch_notification_screen.dart';

class NotificationController extends GetxController {
  String? token = "";
  RxString isRefreshToken = "".obs;
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> requestNotificationPermission() async {
    NotificationSettings notificationSettings = await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: true,
      sound: true,
    );

    if (notificationSettings.authorizationStatus == AuthorizationStatus.authorized) {
      print("User granted permission");
      Get.snackbar("Permission", "User granted notification permission", colorText: Colors.green);
      getDeviceToken();
    } else if (notificationSettings.authorizationStatus == AuthorizationStatus.provisional) {
      print("User granted provisional permission");
      Get.snackbar("Permission", "User granted provisional notification permission", colorText: Colors.orange);
      getDeviceToken(); // Provisional permission still allows notifications.
    } else {
      print("Notification permission denied");
      Get.snackbar("Permission Denied", "Please enable notifications in settings to receive updates.", colorText: Colors.red);
      Future.delayed(const Duration(seconds: 2), () {
        AppSettings.openAppSettings(type: AppSettingsType.notification);
      });
    }
  }

  Future<void> getDeviceToken() async {
    try {
      var deviceToken = await firebaseMessaging.getToken();
      token = deviceToken;
      if(token != null){
        saveToken(token: token.toString());
      }
      print("Device Token :=> $token");
      Get.snackbar("Device Token", token ?? "Unable to fetch token", colorText: Colors.blue);
    } catch (e) {
      print("Error retrieving device token: $e");
    }
  }

  Future<void> saveToken({required String token})async{
    String? userId = FirebaseAuth.instance.currentUser?.uid;
    if(userId == null){
      print("User not logged in");
      return;
    }

    FirebaseFirestore.instance.collection("users").doc(userId).update(
      {
        "deviceToken" : token,
        "updatedAt" : DateTime.now().toString(),
      }
    ).then((value) => Get.snackbar("Updated Device Token", token.toString()),);
  }

   void refreshDeviceToken(){
      try{
        firebaseMessaging.onTokenRefresh.listen((newToken) {
          saveToken(token: newToken);
          print("New Device Token => $newToken");
        },);
      }catch(e){
        print("Error => $e");
      }

  }

  Future<void> initLocalNotification({required RemoteMessage message})async{
    AndroidInitializationSettings androidInitializationSettings = const AndroidInitializationSettings("@mipmap/ic_launcher");
    InitializationSettings initializationSettings = InitializationSettings(android: androidInitializationSettings);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,onDidReceiveNotificationResponse: (payload) {
        handleBackgroundAndTerminatedMessage(message);
    },);
  }

  // Show notification popup
  Future<void> showNotification({required RemoteMessage message})async{
    AndroidNotificationChannel androidNotificationChannel = AndroidNotificationChannel(
        message.notification!.android!.channelId.toString(),
        message.notification!.android!.channelId.toString(),
        importance: Importance.high,showBadge: true,playSound: true
    );

    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        androidNotificationChannel.id.toString(),
        androidNotificationChannel.name.toString(),
        channelDescription: "channelDescription",
        importance: Importance.high,
        priority: Priority.high,
        playSound: true,
        sound: androidNotificationChannel.sound
    );

    NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);

    Future.delayed(Duration.zero,() {
      flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title,
          message.notification!.body,
          notificationDetails,
          payload: "My data"
      );
    },);

  }


  // Foreground message handle
  Future<void> firebaseInit()async{
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? androidNotification = message.notification!.android;

      if(kDebugMode){
        print("Message Title :=> ${notification!.title}");
        print("Message Body :=> ${notification.body}");
      }
      if(Platform.isAndroid){
        initLocalNotification(message: message);
        showNotification(message: message);
      }
    },);
  }

  // background and terminated both
  Future<void> backgroundAndTerminatedMessage()async{
    // For background message
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      handleBackgroundAndTerminatedMessage(message);
    },);

    // For terminated message
    firebaseMessaging.getInitialMessage().then((RemoteMessage? message) {
      if(message != null && message.data.isNotEmpty){
        handleBackgroundAndTerminatedMessage(message);
      }
    },);

  }

  // message handler for handle background and terminated state message
  Future<void> handleBackgroundAndTerminatedMessage(RemoteMessage message)async{
    print("Navigate to appointment screen. Hit here to handle the message. Message data : ${message.data}");
    Get.to(()=> FetchNotificationScreen(message : message));

    // if(message.data['screen'] == 'AliMessageScreen'){
    //   Get.to(()=>const MessageSendSpecificScreen());
    // }else{
    // Get.to(()=> FetchNotificationScreen(message : message));
    // }

  }

  @override
  void onInit() {
    super.onInit();
    requestNotificationPermission();
    refreshDeviceToken();
    firebaseInit();
    backgroundAndTerminatedMessage();
  }
}
