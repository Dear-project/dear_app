import 'package:dear_app/Feature/Auth/School/component/school_search_bar.dart';
import 'package:dear_app/Feature/Auth/School/component/search_school/select_gubun_type_widget.dart';
import 'package:dear_app/Feature/Auth/School/model/school_info.dart';
import 'package:dear_app/Feature/Auth/Shared/component/bottom_button.dart';
import 'package:dear_app/Feature/Auth/School/view_model/controller/school_view_model.dart';
import 'package:dear_app/Feature/Main/Profile/view_model/controller/profile_view_model.dart';
import 'package:dear_app/Feature/Main/Shared/controller/user_role_controller.dart';
import 'package:dear_app/Shared/enums/school_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectSchoolView extends StatefulWidget {
  SelectSchoolView({super.key});

  @override
  State<SelectSchoolView> createState() => _SelectSchoolViewState();
}

class _SelectSchoolViewState extends State<SelectSchoolView> {
  final _schoolVM = Get.put(SchoolViewModel());
  final _profileVM = Get.put(ProfileViewModel());
  final _roleController = UserRoleController.shared;

  @override
  void initState() {
    super.initState();

    _schoolVM.schoolType.value = SchoolType.UNIV;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(
            "학교 선택",
            style: TextStyle(
                fontFamily: "Pretendard",
                fontSize: 22,
                fontWeight: FontWeight.w700),
          ),
          leading: CupertinoButton(
            onPressed: () {
              _profileVM.signOut();
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
            SizedBox(height: 21),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 36),
                child: Column(
                  children: [
                    if(_roleController.isStudent) SelectGubunTypeWidget(schoolType: _schoolVM.schoolType),
                    if(_roleController.isStudent) SizedBox(
                      height: 10,
                    ),
                    SchoolSearchBar(),
                    Expanded(
                      child: Obx(() {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: _schoolVM.schoolInfoList.value.length,
                          itemBuilder: (context, index) {
                            SchoolInfo info =
                                _schoolVM.schoolInfoList.value[index];
                            return GestureDetector(
                              onTap: () {
                                _schoolVM.selectedSchoolInfoIndex.value = index;
                              },
                              child: Container(
                                padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Obx(() => SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            info.schoolName,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: (_schoolVM
                                                          .selectedSchoolInfoIndex
                                                          .value
                                                          .toInt() !=
                                                      index)
                                                  ? Colors.grey
                                                  : Colors.black,
                                            ),
                                          ),
                                        )),
                                    Text(
                                      info.adres,
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }),
                    )
                  ],
                ),
              ),
            )
          ])),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          height: 80,
          padding: EdgeInsets.all(0),
          color: Colors.white,
          child: Center(child: BottomButton(
            action: () {
              _schoolVM.register();
            },
          )),
        ));
  }
}
