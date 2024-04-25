import 'package:dear_app/Auth/School/ui/selectSchoolView.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(SelectSchoolView());
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
        backgroundColor: Colors.white,
        body: Center(
          child: Text(
            "DEAR.",
            style: TextStyle(
                fontFamily: 'Assistant',
                fontWeight: FontWeight.w800,
                fontSize: 55,
                color: Color(0xff0E2764)),
          ),
        ),
      ),
    );
  }
}
