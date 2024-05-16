import 'package:dear_app/Feature/Auth/school/view_model/controller/school_view_model.dart';
import 'package:dear_app/Shared/component/custom_drop_down.dart';
import 'package:dear_app/Shared/enums/school_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectGubunTypeWidget extends StatelessWidget {
  SelectGubunTypeWidget({Key? key}) : super(key: key);

  final _schoolVM = Get.put(SchoolViewModel());

  @override
  Widget build(BuildContext context) {
    return CustDropDown(
      borderWidth: 1,
      borderRadius: 16,
      maxListHeight: 200,
      items:  [
        CustDropdownMenuItem(
          value: SchoolType.ELEM,
          child: Text(
            SchoolTypeUtils.typeToString(SchoolType.ELEM),
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
        ),
        CustDropdownMenuItem(
          value: SchoolType.MIDD,
          child: Text(
            SchoolTypeUtils.typeToString(SchoolType.MIDD),
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
        ),
        CustDropdownMenuItem(
          value: SchoolType.HIGH,
          child: Text(
            SchoolTypeUtils.typeToString(SchoolType.HIGH),
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
        )
      ],
      hintText: "학교구분 선택하기",
      onChanged: (val) {
        _schoolVM.schoolType.value = val;
      },
    );

    TextFormField(
      readOnly: true,
      // controller: _signupVM.nameController.value,
      // focusNode: _signupVM.nameFocusNode.value,
      onTap: () {},
      onChanged: (value) {},
      cursorColor: Color(0xff0E2764),
      decoration: InputDecoration(
        suffixIcon: ImageIcon(AssetImage("assets/icons/triangle_down.png")),
        hintText: "학교구분 선택하기",
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
}
