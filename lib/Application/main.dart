import 'package:dear_app/Feature/Auth/Signup/ui/fifthSignupView.dart';
import 'package:dear_app/Feature/Auth/Signup/ui/fourthSignupView.dart';
import 'package:dear_app/Feature/Auth/Signup/ui/thirdSignupView.dart';
import 'package:flutter/material.dart';
import 'package:dear_app/Feature/Main/Navigation/ui/mainView.dart';
import 'package:dear_app/Feature/Main/Chat/ui/inChatView.dart';

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
      home: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        // body: ThirdSignupView(),
        body: FourthSignupView(),
      ),
    );
  }
}
