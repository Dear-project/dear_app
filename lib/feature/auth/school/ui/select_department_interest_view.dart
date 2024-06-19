import 'package:dear_app/feature/auth/shared/component/bottom_button.dart';
import 'package:dear_app/feature/auth/school/component/search_department/input_search_major_widget.dart';
import 'package:dear_app/feature/auth/school/component/search_department/select_major_widget.dart';
import 'package:dear_app/feature/auth/school/component/search_department/select_subject_widget.dart';
import 'package:dear_app/feature/auth/school/view_model/controller/school_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectDepartmentInterestView extends StatelessWidget {
  SelectDepartmentInterestView({super.key});

  final _schoolVM = Get.put(SchoolViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "관심 학과 선택",
            style: TextStyle(
                fontFamily: "Pretendard",
                fontSize: 22,
                fontWeight: FontWeight.w700),
          ),
          leading: CupertinoButton(
            onPressed: () {
              Get.back();
            },
            child: Icon(
              Icons.chevron_left,
              color: Color(0xff0E2764),
            ),
          ),
          actions: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: CupertinoButton(
                  onPressed: () {},
                  child: Text(
                    "초기화",
                    style: TextStyle(
                        fontFamily: "Pretendard",
                        color: Color(0xff0E2764),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ))
          ],
        ),
        body: SafeArea(
          child: Center(
              child: Column(children: [
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "DEAR",
                  style: TextStyle(
                    fontFamily: "Assistant",
                    fontWeight: FontWeight.w800,
                    fontSize: 55,
                    color: Color(0xff0E2764),
                  ),
                ),
                Text(
                  ".",
                  style: TextStyle(
                    fontFamily: "Assistant",
                    fontWeight: FontWeight.w800,
                    fontSize: 45,
                    color: Color(0xff0E2764),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36),
              child: SizedBox(height: 55, child: InputSearchMajorWidget()),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SelectSubjectWidget(),
                  SelectMajorWidget()
                  // Expanded(flex: 2,child: Container(color: Colors.blue,),)
                ],
              ),
            )
          ])),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          height: 80,
          padding: EdgeInsets.all(0),
          color: Colors.white,
          child: CupertinoButton(
              onPressed: () {},
              child: BottomButton(
                action: () {
                  _schoolVM.toDepartmentView();
                },
              )),
        ));
  }
}
