import 'package:dear_app/Feature/Auth/Onboarding/ui/onboardingView.dart';
import 'package:dear_app/Feature/Auth/School/ui/selectSchoolView.dart';
import 'package:flutter/material.dart';

import '../Feature/Auth/School/ui/selectDeparmentView.dart';
import '../Feature/Main/ui/mainView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
              cursorColor: const Color(0xff0E2764),
              selectionColor: const Color(0xff0E2764).withOpacity(0.2),
              selectionHandleColor: const Color(0xff0E2764))),
      home: MainView()
    );
  }
}
