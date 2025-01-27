import 'package:dear_app/Shared/component/custom_drop_down.dart';
import 'package:dear_app/Shared/enums/school_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectGubunTypeWidget extends StatelessWidget {

  Rxn<SchoolType> schoolType;

  SelectGubunTypeWidget({required this.schoolType});

  @override
  Widget build(BuildContext context) {
    return CustDropDown(
      borderWidth: 1,
      borderRadius: 16,
      maxListHeight: 200,
      items: [
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
        schoolType.value = val;
      },
    );

  }
}