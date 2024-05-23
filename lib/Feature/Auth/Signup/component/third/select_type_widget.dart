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
    return Obx(() => GestureDetector(onTap: () {
      _signupVM.type.value = userType;
    }, child: Container(
      width: 165,
      height: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color(isSelected ? 0xffEBEFFF : 0xffF4F5F9),
        border: Border.all(color: Color(isSelected ? 0xff0E2764 : 0xffC5D0DA)),
      ),
      child: Column(
        children: [
          SizedBox(height: 3),
          Transform.scale(
              scale: 1.4,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  children: [
                    Checkbox(
                      value: isSelected,
                      onChanged: (value) {
                        _signupVM.type.value = userType;
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      side: MaterialStateBorderSide.resolveWith(
                            (states) => BorderSide(color: Color(0xffC5D0DA)),
                      ),
                      fillColor: MaterialStatePropertyAll(
                          Color(isSelected ? 0xffE6EDF7 : 0xffF1F2F3)),
                      checkColor: Color(0xff0E2764),
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
    ),));
  }


}