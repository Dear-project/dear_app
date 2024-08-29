import 'package:dear_app/Feature/Auth/Shared/component/dear_textfield.dart';
import 'package:dear_app/Feature/Main/Profile/view_model/controller/profile_view_model.dart';
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
        title: Text("수정하기",
          style: TextStyle(
            color: Color(0xff000000),
            fontFamily: "Pretendard",
            fontSize: 20,
            fontWeight: FontWeight.w600
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: context.width,
          height: context.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DearTextField(TextFieldType.newPw, _profileVM.editPWController, isObscureText: true)
            ],
          ),
        )
      )
    );
  }

}