import 'package:flutter/material.dart';

class signupView extends StatelessWidget {
  const signupView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 400),
              const Padding(
                padding: EdgeInsets.only(bottom: 3),
                child: Text(
                  "사소한 질문도 소중히",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Text(
                "DEAR.",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  // Container(
                  //   width: 140,
                  //   height: 23,
                  //   decoration: BoxDecoration(
                  //       borderRadius: const BorderRadius.only(
                  //         bottomLeft: Radius.circular(5),
                  //         bottomRight: Radius.circular(5),
                  //       ),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.grey.withOpacity(0.7),
                  //           blurRadius: 5.0,
                  //           spreadRadius: 0.0,
                  //           offset: const Offset(0, 7),
                  //         )
                  //       ]),
                  // ),
                  const Text(
                    "회원가입하고 숨은 꿀팁 찾기",
                    style: TextStyle(fontSize: 10, height: 1.2),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(342, 56),
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xff0E2764),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  "시작하기",
                  style: TextStyle(fontSize: 16, height: 1.2),
                ),
              ),
              const SizedBox(height: 9),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(342, 56),
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xffD5DCEC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  "로그인",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "문의하기",
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
