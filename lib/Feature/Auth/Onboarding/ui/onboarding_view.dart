import 'dart:math';

import 'package:dear_app/Feature//Auth/Onboarding/component/speechBubble.dart';
import 'package:dear_app/Feature/Auth/Onboarding/component/onboarding_button.dart';
import 'package:dear_app/Feature/Auth/Signin/ui/firstSigninView.dart';
import 'package:dear_app/Feature/Auth/Signup/ui/firstSignupView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  ScrollController _scrollController = ScrollController();
  List<Color> colorset = [Color(0xff0E2764), Color(0xffEBEFFF), Color(0xffFFB3B3).withOpacity(0.5)];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      animateScroll(
          _scrollController.position.maxScrollExtent,
          10,
          _scrollController
      );
    });

  }

  animateScroll(double direction, int seconds, ScrollController scrollController) {
    scrollController
        .animateTo(direction,
            duration: Duration(seconds: seconds), curve: Curves.linear)
        .then((value) {
          scrollController.jumpTo(scrollController.position.minScrollExtent);
          animateScroll(direction, seconds, scrollController);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.white,
        toolbarHeight: 10,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28),
                    child: MasonryGridView.builder(
                        controller: _scrollController,
                        gridDelegate:
                            SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemCount: 10,
                        itemBuilder: (context, index) => Transform.translate(
                              offset: Offset(0, index.isOdd ? 45 : -45),
                              child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 10),
                                  child: Container(
                                    height: 210,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: colorset[Random().nextInt(colorset.length)],
                                    ),
                                  )),
                            )),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 190,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withOpacity(0),
                          Colors.white
                        ]
                      )
                    ),
                  ),
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
                ],
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
            OnboardingButton(
              content: "시작하기",
              background: Color(0xff0E2764),
              foreground: Colors.white,
              onPressed: () {
                Get.to(() => FirstSignupView());
              },

            ),
            OnboardingButton(
              content: "로그인",
              background: Color(0xffD5DCEC),
              foreground: Colors.white,
              onPressed: () {
                Get.to(() => FirstSigninView());

              },
            ),
            SizedBox(height: 100)
          ],
        ),
      ),
    );
  }
}
