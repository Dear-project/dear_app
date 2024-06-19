import 'package:dear_app/feature/auth/school/view_model/controller/school_view_model.dart';
import 'package:dear_app/shared/component/custom_drop_down.dart';
import 'package:dear_app/shared/enums/school_type.dart';
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

  }
}
