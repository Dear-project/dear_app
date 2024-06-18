import 'dart:ffi';
import 'package:dear_app/Feature/Auth/Onboarding/ui/first_join_view.dart';
import 'package:dear_app/Feature/Auth/Onboarding/ui/onboarding_view.dart';
import 'package:dear_app/Feature/Auth/School/ui/select_school_view.dart';
import 'package:dear_app/Feature/Auth/Signin/ui/first_signin_view.dart';
import 'package:dear_app/Feature/Main/Chat/ui/chat_profile_view.dart';
import 'package:dear_app/Feature/Main/Home/ui/home_view.dart';
import 'package:dear_app/Feature/Main/Navigation/ui/main_view.dart';
import 'package:dear_app/Feature/Main/Profile/ui/profile_view.dart';
import 'package:dear_app/Feature/Main/Shared/component/professor_cell.dart';
import 'package:dear_app/Shared/theme/dear_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
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
        // home: OnboardingView()
      home: ProfileView()
    );
  }
}
