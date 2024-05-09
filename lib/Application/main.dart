import 'package:dear_app/Feature/Auth/Onboarding/ui/onboarding_view.dart';
import 'package:dear_app/Shared/theme/dearColors.dart';
import 'package:dear_app/Shared/theme/dear_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: DearTheme,
      localizationsDelegates:  const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ko', '')
      ],
      home: OnboardingView()
    );
  }
}
