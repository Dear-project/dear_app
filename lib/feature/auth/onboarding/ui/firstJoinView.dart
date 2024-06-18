import 'dart:async';
import 'dart:io';
import 'package:dear_app/Feature/Auth/Onboarding/ui/onboarding_view.dart';
import 'package:dear_app/Shared/component/dearLogo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FirstJoinView extends StatefulWidget {
  FirstJoinView({super.key});

  @override
  State<StatefulWidget> createState() => _FirstJoinViewState();
}

class _FirstJoinViewState extends State<FirstJoinView>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  double offsetY = -124; // 124

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), () {
      controller.stop();
      controller.dispose();
      Get.offAll(
            () => OnboardingView(),
        duration: Duration(milliseconds: 800),
      );
    });


    controller = AnimationController(
      duration: Duration(milliseconds: 400),
      vsync: this,
    )
      ..forward()
      ..addListener(() async {
        if (controller.isCompleted) {
          controller.stop();

          await Future.delayed(Duration(milliseconds: 500));

          controller.reset();

          if (offsetY < 62) {
            offsetY += 62;
          } else {
            offsetY = -124;
          }
          controller.forward();
        }
      });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 340,
              height: 56,
              decoration: BoxDecoration(
                  color: Color(0xffEBEFFF),
                  border: Border.all(color: Color(0xffE6E6E6)),
                  borderRadius: BorderRadius.circular(13)),
            ),
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) => Transform.translate(
                offset: Offset(0, controller.value * 62 + offsetY),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "학생이 학생에게",
                        style: TextStyle(
                            fontFamily: "Pretendard",
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            color: Color(0xff0E2764)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "학생이 교수에게",
                        style: TextStyle(
                            fontFamily: "Pretendard",
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            color: Color(0xff0E2764)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "학생이 AI에게",
                        style: TextStyle(
                            fontFamily: "Pretendard",
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            color: Color(0xff0E2764)),
                      ),
                    ]),
              ),
            ),
            Column(
              children: [
                Expanded(child: Container(color: Colors.white)),
                SizedBox(height: 58),
                Expanded(child: Container(color: Colors.white)),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DearLogo(
                  size: 50,
                  color: Color(0xffD1D1D1),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: Container(
                      padding: EdgeInsets.only(bottom: 80),
                      height: 240,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "소중한 질문을",
                            style: TextStyle(
                                fontFamily: "Pretendard",
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "남기다",
                            style: TextStyle(
                                fontFamily: "Pretendard",
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ))
              ],
            )
          ],
        )));
  }
}
