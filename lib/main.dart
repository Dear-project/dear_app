import 'dart:io';

import 'package:dear_app/Feature/Auth/Onboarding/ui/first_join_view.dart';
import 'package:dear_app/Shared/controller/user_controller.dart';
import 'package:dear_app/Shared/service/secure_storage_service.dart';
import 'package:dear_app/Shared/theme/dear_theme.dart';
import 'package:dear_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await _initFirebaseMessage();
  FirebaseMessaging.instance.getToken().then((value) => print(value));
  _requestPermissionForIOS();
  await initServices();
  runApp(MyApp());
}

Future<void> _initFirebaseMessage() async {
  // Get inicial message if the application
  // has been opened from a terminated state.
  final message = await FirebaseMessaging.instance.getInitialMessage();
  // Check notification data
  if (message != null) {
    // Debug
    debugPrint('getInitialMessage() -> data: ${message.data}');
    // Handle notification data
    await _handleNotificationClick(message.data);
  }

  // Returns a [Stream] that is called when a user
  // presses a notification message displayed via FCM.
  // Note: A Stream event will be sent if the app has
  // opened from a background state (not terminated).
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    // Debug
    debugPrint('onMessageOpenedApp() -> data: ${message.data}');
    // Handle notification data
    await _handleNotificationClick(message.data);
  });

  // Listen for incoming push notifications
  FirebaseMessaging.onMessage.listen((RemoteMessage? message) async {
    // Debug
    debugPrint('onMessage() -> data: ${message?.data}');
    // Handle notification data
    await _handleNotificationClick(message?.data);
  });
}

Future<void> _handleNotificationClick(Map<String, dynamic>? data) async {

}

void _requestPermissionForIOS() async {
  if (Platform.isIOS) {
    await FirebaseMessaging.instance.requestPermission();
  }
}



Future<void> initServices() async {
  await Get.putAsync<SecureStorageService>(() async => SecureStorageService());
  await Get.putAsync<UserController>(() async => UserController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: DearTheme,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ko', '')],
        home: FirstJoinView());
  }
}
