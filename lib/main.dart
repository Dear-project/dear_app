import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Text(
                "DEAR.",
                style: TextStyle(
                  fontFamily: 'Assistant',
                  fontWeight: FontWeight.w800,
                  fontSize: 55,
                  color: Color(0xff0E2764)
                ),
              ),
            )));
  }
}
