import 'package:dear_app/feature/auth/signup/component/name/select_date_widget.dart';
import 'package:dear_app/feature/auth/signup/view_model/signup_view_model.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputBirthdateWidget extends StatelessWidget {
  InputBirthdateWidget({Key? key}) : super(key: key);

  final _signupVM = Get.put(SignUpViewModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _signupVM.birthdateController.value,
      readOnly: true,
      onTap: () {
        _showDatePicker(context,
            DateFormat('yyyy-MM-dd').parse(selectedDate ?? '2000-01-01'));
      },
      onChanged: (value) {},
      cursorColor: Color(0xff0E2764),
      decoration: InputDecoration(
        hintText: "생년월일",
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
    );
  }

  void _showDatePicker(BuildContext context, DateTime initDate) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext builderContext) {
        return Container(
          height: 300,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                  height: 200,
                  child: SelectDateWidget(
                    selectedDate: initDate,
                  )),
              CupertinoButton(
                  onPressed: () {
                    Navigator.of(builderContext).pop();
                  },
                  padding: EdgeInsets.symmetric(),
                  color: Color(0xff0E2764),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  child: Container(
                      width: 340,
                      height: 55,
                      child: Center(
                        child: Text(
                          "확인",
                          style: TextStyle(
                              fontFamily: "Pretendard",
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ))),
            ],
          ),
        );
      },
    );
  }

  get selectedDate => _signupVM.birthdateController.value.text.isEmpty
      ? '2000-01-01'
      : _signupVM.birthdateController.value.text;
}
