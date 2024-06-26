import 'package:dear_app/Feature/Auth/School/view_model/controller/school_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputSearchMajorWidget extends StatelessWidget {
  InputSearchMajorWidget({Key? key}) : super(key: key);

  final _schoolVM = Get.put(SchoolViewModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _schoolVM.searchMajorSubjectController.value,
      onChanged: (value) {
        print(value);
      },
      onFieldSubmitted: (value) async {
        print(value);
        _schoolVM.searchMajorSubject(keyword: value);
      },
      cursorColor: Color(0xff0E2764),
      decoration: InputDecoration(
          hintText: "관심 학과를 검색해 주세요",
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
          suffixIcon: Icon(Icons.search_outlined)),
      maxLines: 1,
    );
  }
}
