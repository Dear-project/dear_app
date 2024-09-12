import 'package:dear_app/Feature/Auth/School/view_model/controller/school_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SchoolSearchBar extends StatelessWidget {
  SchoolSearchBar({Key? key}) : super(key: key);

  final _schoolVM = Get.put(SchoolViewModel());

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350,
        height: 45,
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xffC5D0DA)),
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 270,
                child: CupertinoTextField(
                    controller: _schoolVM.searchKeywordController.value,
                    cursorColor: Colors.black.withOpacity(0.3),
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    decoration: BoxDecoration(),
                    onSubmitted: (_) {
                      _schoolVM.searchSchool(
                          keyword:
                              _schoolVM.searchKeywordController.value.text,
                      );
                    })),
            Container(
                child: CupertinoButton(
                    padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                    child: Icon(
                      CupertinoIcons.search,
                      color: Color(0xff787878),
                    ),
                    onPressed: () {
                      _schoolVM.searchSchool(
                          keyword:
                              _schoolVM.searchKeywordController.value.text,
                      );
                    }))
          ],
        ));
  }
}
