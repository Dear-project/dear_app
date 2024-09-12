import 'package:dear_app/Feature/Auth/School/component/school_search_bar.dart';
import 'package:dear_app/Feature/Auth/School/component/search_school/select_gubun_type_widget.dart';
import 'package:dear_app/Feature/Auth/Shared/component/bottom_button.dart';
import 'package:dear_app/Feature/Auth/Shared/component/dear_textfield.dart';
import 'package:dear_app/Feature/Main/Profile/component/profile_search_bar.dart';
import 'package:dear_app/Feature/Main/Profile/view_model/controller/profile_view_model.dart';
import 'package:dear_app/Shared/enums/school_type.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileView extends StatelessWidget {
  final _profileVM = Get.put(ProfileViewModel());

  EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          scrolledUnderElevation: 0.0,
          backgroundColor: Colors.white,
          leading: CupertinoButton(
            onPressed: () {
              Get.back();
            },
            child: DearIcons.arrowLeft,
          ),
          title: Text(
            "수정하기",
            style: TextStyle(
                color: Color(0xff000000),
                fontFamily: "Pretendard",
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: _profileVM.model.value?.imgPath != null
                        ? NetworkImage(_profileVM.model.value!.imgPath!)
                        : DearIcons.my.image,
                  ),
                ),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
                    child: SizedBox(
              width: context.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "비밀번호",
                        style: TextStyle(
                          fontFamily: "Pretendard",
                          fontSize: 12,
                          color: Color(0xff333333),
                        ),
                      ),
                      DearTextField(
                          TextFieldType.newPw, _profileVM.editPWController,
                          isObscureText: true)
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "학교 선택",
                        style: TextStyle(
                          fontFamily: "Pretendard",
                          fontSize: 12,
                          color: Color(0xff333333),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SelectGubunTypeWidget(schoolType: Rxn<SchoolType>()),
                          SizedBox(
                            height: 10,
                          ),
                          ProfileSearchBar(controller: TextEditingController())
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "학과 선택",
                        style: TextStyle(
                          fontFamily: "Pretendard",
                          fontSize: 12,
                          color: Color(0xff333333),
                        ),
                      ),
                      ProfileSearchBar(controller: TextEditingController())
                    ],
                  ),
                ],
              ),
            ))),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: BottomButton(buttonText: "완료", action: () {
                  
                }))
          ],
        ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0.0,
        height: 0,
      ),
    );
  }
}
