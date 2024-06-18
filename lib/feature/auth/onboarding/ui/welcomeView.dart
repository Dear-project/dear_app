import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000)
    )
    ..reverse(from: 1);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0.0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: const [
                Text(
                  "환영합니다!",
                  style: TextStyle(
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w700,
                      fontSize: 45,
                      color: Color(0xff0E2764)),
                ),
                Text(
                  "이제부터 DEAR.와 함께 성장 해 봐요.",
                  style: TextStyle(
                      fontFamily: "Assistant",
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                      color: Color(0xff787878)),
                ),
              ],
            ),
            Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff2A57F5), width: 8),
                    shape: BoxShape.circle),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                    DearIcons.check,
                    AnimatedBuilder(
                        builder: (BuildContext context, Widget? child) {
                          return Transform.scale(
                            alignment: Alignment.centerRight,
                            scaleX: controller.value,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white
                                )
                            ),
                          );
                        },
                      animation: controller,

                    )
                  ]
                  ),
                )
            ),
            Text(
              "화면을 터치하세요.",
              style: TextStyle(
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  color: Color(0xffAAAAAA)),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        color: Colors.white,
      ),
    );
  }
}
