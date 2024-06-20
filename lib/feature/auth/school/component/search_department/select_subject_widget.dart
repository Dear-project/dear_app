import 'package:dear_app/Feature/Auth/School/view_model/controller/school_view_model.dart';
import 'package:dear_app/Shared/enums/major_subject_type.dart';
import 'package:dear_app/Shared/theme/dear_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectSubjectWidget extends StatelessWidget {
  SelectSubjectWidget({Key? key}) : super(key: key);

  final _schoolVM = Get.put(SchoolViewModel());

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      color: DearColors.black.black200,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: MajorSubjectTypeUtils.majorSubjects.length,
        itemBuilder: (context, index) {
          MajorSubjectType majorSubjectType =
              MajorSubjectTypeUtils.majorSubjects[index];
          return GestureDetector(
            onTap: () {
              _schoolVM.selectedMajorSubject.value = majorSubjectType.key;
            },
            child: Container(
                color: DearColors.black.black200,
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
                child: Obx(() => Text(
                      MajorSubjectTypeUtils.typeToString(majorSubjectType),
                      maxLines: 1,
                      style: (_schoolVM.selectedMajorSubject.value ==
                              majorSubjectType.key)
                          ? TextStyle(
                              fontSize: 17,
                              color: DearColors.main,
                              fontWeight: FontWeight.bold)
                          : TextStyle(fontSize: 16, color: Colors.black),
                    ))),
          );
        },
      ),
    ));
  }
}
