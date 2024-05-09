import 'package:dear_app/Feature//Auth/Onboarding/component/speechBubble.dart';
import 'package:dear_app/Feature/Auth/Signup/ui/firstSignupView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Text(
                "DEAR.",
                style: TextStyle(
                  fontSize: 50,
                  fontFamily: "Assistant",
                  fontWeight: FontWeight.w800,
                  color: Color(0xff0E2764),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  // Padding(
                  //   padding: EdgeInsets.only(top: 10),
                  //   child: speechBubble(),
                  // ),
                  SpeechBubble(),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                    Get.to(() => FirstSignupView());
                },
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
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.bold),
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
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      );
  }
}
