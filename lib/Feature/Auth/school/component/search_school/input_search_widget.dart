
import 'package:dear_app/Feature/Auth/Signup/view_model/controller/signup_view_model.dart';
import 'package:dear_app/Feature/Auth/school/view_model/controller/school_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputSearchWidget extends StatelessWidget {
  InputSearchWidget({Key? key}) : super(key: key);

  final _schoolVM = Get.put(SchoolViewModel()) ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextFormField(
        controller: _schoolVM.searchKeywordController.value,
        onChanged: (value) {
          print(value);
        },
        onFieldSubmitted: (value) async {
          print(value);
          _schoolVM.searchSchool(keyword: value);
        },
        cursorColor: Color(0xff0E2764),
        decoration: InputDecoration(
          hintText: "학교를 검색해주세요",
          hintStyle: TextStyle(
            height: 1.3,
            fontFamily: "Pretendard",
            fontSize: 17,
            fontWeight: FontWeight.w300,
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color(0xff0E2764), width: 0.0),
              borderRadius:
              BorderRadius.all(Radius.circular(16)),
              gapPadding: BorderSide.strokeAlignCenter),
          enabledBorder: const OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(
                color: Color(0xffC5D0DA), width: 1.0),
          ),
          suffixIcon:Icon(Icons.search_outlined)
        ),
        maxLines: 1,
      ),
    );
  }
}