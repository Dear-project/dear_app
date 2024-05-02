import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TextFieldType { email, authCheck, pw, pwCheck, name, birth }
enum TextFieldPosition { top, bottom }

class DearTextField extends StatefulWidget {

  final TextFieldType type;
  final _TextEditController;

  const DearTextField(this.type, this._TextEditController, {super.key});

  @override
  State<DearTextField> createState() => _DearTextFieldState(type, _TextEditController);
}

class _DearTextFieldState extends State<DearTextField> {

  final TextFieldType type;
  final _TextEditController;

  @override
  void dispose() {
    _TextEditController.dispose();
    super.dispose();
  }

  _DearTextFieldState(this.type, this._TextEditController);

  String getHint(TextFieldType type) {
    String hintText = "";
    switch (type) {
      case TextFieldType.email:
        hintText = "이메일";
      case TextFieldType.authCheck:
        hintText = "인증확인";
      case TextFieldType.pw:
        hintText = "비밀번호";
      case TextFieldType.pwCheck:
        hintText = "비밀번호 확인";
      case TextFieldType.name:
        hintText = "이름";
      case TextFieldType.birth:
        hintText = "생년월일";
    }
    return hintText;
  }
  String getPosition(TextFieldType type) {
    TextFieldPosition position;
    switch (type) {
      case TextFieldType.email || TextFieldType.pw || TextFieldType.name:
        position = TextFieldPosition.top;
      case TextFieldType.authCheck || TextFieldType.pwCheck || TextFieldType.birth:
        position = TextFieldPosition.bottom;
    }
    return position.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 56,
      child: Stack(
        alignment: Alignment.center,
        children: [
          TextField(
            controller: _TextEditController,
            onChanged: (value) {
              print("${value}");
            },
            cursorColor: Color(0xff0E2764),
            decoration: InputDecoration(
              hintText: "${getHint(type)}",
              hintStyle: TextStyle(
                height: 1.3,
                fontFamily: "Pretendard",
                fontSize: 17,
                fontWeight: FontWeight.w300,
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff0E2764), width: 0.0),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  gapPadding: BorderSide.strokeAlignCenter),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide(color: Color(0xffC5D0DA), width: 1.0),
              ),
            ),
            maxLines: 1,
          ),
          if (type == TextFieldType.authCheck)
            Row(
              children: [
                Spacer(flex: 1),
                Text(
                    style: TextStyle(
                      height: 1.2,
                      fontFamily: "Pretendard",
                      color: Color(0xff0E2764),
                      fontSize: 15,
                    ),
                    "4:52"),
                SizedBox(width: 25),
              ],
            )
        ],
      ),
    );
  }
}

// class DearTextField extends StatelessWidget {
  // final TextFieldType type;
  //
  // DearTextField(this.type, {super.key});

  // String getHint(TextFieldType type) {
  //   String hintText = "";
  //   switch (type) {
  //     case TextFieldType.email:
  //       hintText = "이메일";
  //     case TextFieldType.authCheck:
  //       hintText = "인증확인";
  //     case TextFieldType.pw:
  //       hintText = "비밀번호";
  //     case TextFieldType.pwCheck:
  //       hintText = "비밀번호 확인";
  //     case TextFieldType.name:
  //       hintText = "이름";
  //     case TextFieldType.birth:
  //       hintText = "생년월일";
  //   }
  //   return hintText;
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     width: 340,
  //     height: 56,
  //     child: Stack(
  //       alignment: Alignment.center,
  //       children: [
  //         TextField(
  //           cursorColor: Color(0xff0E2764),
  //           decoration: InputDecoration(
  //             hintText: "${getHint(type)}",
  //             hintStyle: TextStyle(
  //               height: 1.3,
  //               fontFamily: "Pretendard",
  //               fontSize: 17,
  //               fontWeight: FontWeight.w300,
  //             ),
  //             focusedBorder: OutlineInputBorder(
  //                 borderSide: BorderSide(color: Color(0xff0E2764), width: 0.0),
  //                 borderRadius: BorderRadius.all(Radius.circular(16)),
  //                 gapPadding: BorderSide.strokeAlignCenter),
  //             enabledBorder: const OutlineInputBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(16)),
  //               borderSide: BorderSide(color: Color(0xffC5D0DA), width: 1.0),
  //             ),
  //           ),
  //           maxLines: 1,
  //         ),
  //         if (type == TextFieldType.authCheck)
  //           Row(
  //             children: [
  //               Spacer(flex: 1),
  //               Text(
  //                   style: TextStyle(
  //                     height: 1.2,
  //                     fontFamily: "Pretendard",
  //                     color: Color(0xff0E2764),
  //                     fontSize: 15,
  //                   ),
  //                   "4:52"),
  //               SizedBox(width: 25),
  //             ],
  //           )
  //       ],
  //     ),
  //   );
  // }
// }

/*
theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Color(0xff0E2764),
          selectionColor: Color(0xff0E2764).withOpacity(0.2),
          selectionHandleColor: Color(0xff0E2764)
        )
      ),
 */
