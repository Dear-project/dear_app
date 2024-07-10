import 'package:dear_app/Feature/Auth/Onboarding/ui/first_join_view.dart';
import 'package:dear_app/Shared/controller/user_controller.dart';
import 'package:dear_app/Shared/service/secure_storage_service.dart';
import 'package:dear_app/Shared/theme/dear_theme.dart';
import 'package:dear_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initServices();
  runApp(MyApp());
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
