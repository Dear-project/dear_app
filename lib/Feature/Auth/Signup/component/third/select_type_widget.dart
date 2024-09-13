import 'package:dear_app/Feature/Auth/Signup/component/check_toggle.dart';
import 'package:dear_app/Feature/Auth/Signup/view_model/signup_view_model.dart';
import 'package:dear_app/Shared/enums/user_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectTypeWidget extends StatelessWidget {
  UserType userType;

  final _signupVM = Get.put(SignUpViewModel());

  SelectTypeWidget({required this.userType});

  get isSelected => _signupVM.type.value == userType;

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
      onTap: () {
        _signupVM.type.value = userType;
      },
      child: Container(
        width: 165,
        height: 260,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color(isSelected ? 0xffEBEFFF : 0xffF4F5F9),
          border: Border.all(
              color: Color(isSelected ? 0xff0E2764 : 0xffC5D0DA)),
        ),
        child: Column(
          children: [
            Transform.scale(
                scale: 1.16,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16, 6, 0, 0),
                  child: Row(
                    children: [
                      CheckToggle(
                        toggle: isSelected,
                        onPressed: () {
                          _signupVM.type.value = userType;
                        },
                      ),
                      Spacer(flex: 1),
                    ],
                  ),
                )),
            SizedBox(height: 130),
            Text(
              UserTypeUtils.typeToString(userType),
              style: TextStyle(
                fontFamily: "Pretendard",
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}