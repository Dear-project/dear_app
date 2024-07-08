import 'package:dear_app/Feature/Auth/signup/component/dear_textfield_button.dart';
import 'package:dear_app/Shared/theme/dear_color.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WritingView extends StatefulWidget {
  const WritingView({super.key});

  @override
  State<WritingView> createState() => _WritingViewState();
}

class _WritingViewState extends State<WritingView> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DearColors.white,
      appBar: AppBar(
        surfaceTintColor: DearColors.white,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 12),
          child: CupertinoButton(
              padding: EdgeInsets.zero,
              child: Image(
                image: DearIcons.back.image,
                width: 32,
                height: 32,
                fit: BoxFit.fitWidth,
                color: Colors.black,
              ),
              onPressed: () {
                Get.back();
              }),
        ),
        title: Text(
          "글쓰기",
          style: TextStyle(
            fontFamily: "Pretendard",
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Transform.scale(
              scale: 0.8,
              child: DearTextFieldButton(
                  action: () {
                    print("게시하기 button clicked!");
                  },
                  buttonText: "게시하기"),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 27),
            child: TextField(
              controller: _titleController,
              style: TextStyle(
                fontFamily: "Pretendard",
              ),
              decoration: InputDecoration(
                hintText: "제목",
                hintStyle: TextStyle(
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Color(0xffAAAAAA),
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          ColoredBox(
            color: Color(0xffD1D1D1),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 1,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 27),
            child: TextField(
              controller: _contextController,
              style: TextStyle(
                fontFamily: "Pretendard",
              ),
              decoration: InputDecoration(
                hintText: "내용",
                hintStyle: TextStyle(
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Color(0xffAAAAAA),
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          Spacer(flex: 1),
          ColoredBox(
            color: Color(0xffF1F1F1),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 1,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 27),
            child: Row(
              children: [
                SizedBox(
                  width: 26,
                  height: 26,
                  child: DearIcons.attach,
                ),
                SizedBox(width: 11),
                SizedBox(
                  width: 26,
                  height: 26,
                  child: DearIcons.photo,
                ),
              ],
            ),
          ),
          SizedBox(height: 45),
        ],
      ),
    );
  }
}
