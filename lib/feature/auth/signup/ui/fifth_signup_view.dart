import 'package:dear_app/Feature//Auth/Shared/component/dear_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dear_app/Shared/component/dear_logo.dart';
import 'package:dear_app/Feature/Auth/Shared/component/bottom_button.dart';

class FifthSignupView extends StatelessWidget {
  FifthSignupView({super.key});

  final _topTextEditController = TextEditingController();
  final _bottomTextEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                CupertinoIcons.chevron_left,
                color: Color(0xffAAAAAA),
                size: 30,
              ),
            )),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              DearLogo(size: 55),
              SizedBox(height: 21),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 36),
                child: Row(
                  children: [
                    Text(
                      "계정에 필요한\n정보를 입력해 주세요.",
                      style: TextStyle(
                        height: 1.2,
                        fontFamily: "Pretendard",
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    )
                  ],
                ),
              ),
              SizedBox(height: 45),
              DearTextField(TextFieldType.name, _topTextEditController),
              SizedBox(height: 15),
              DearTextField(TextFieldType.birth, _bottomTextEditController),
              Spacer(flex: 1),
              BottomButton(action: () {}),
              SizedBox(height: 45),
            ],
          ),
        ),
      ),
    );
  }
}
