
import 'package:dear_app/feature/auth/onboarding/ui/first_join_view.dart';
import 'package:dear_app/shared/service/secure_storage_service.dart';
import 'package:dear_app/shared/theme/dear_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

void main() async {
  await initServices();
  runApp(MyApp());
}

Future<void> initServices() async {
  await Get.putAsync<SecureStorageService>(() async => SecureStorageService());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: DearTheme,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ko', '')],
        home: FirstJoinView()
    );
  }
}
