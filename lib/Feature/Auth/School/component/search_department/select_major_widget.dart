import 'package:dear_app/Feature/Auth/School/model/major_info.dart';
import 'package:dear_app/Feature/Auth/School/view_model/controller/school_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectMajorWidget extends StatelessWidget {
  SelectMajorWidget({Key? key}) : super(key: key);

  final _schoolVM = Get.put(SchoolViewModel());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Obx(() {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: _schoolVM.majorInfoList.value.length,
          itemBuilder: (context, index) {
            MajorInfo info = _schoolVM.majorInfoList.value[index];
            return InkWell(
              onTap: () {
                _schoolVM.selectedMajorlInfoIndex.value = index;
              },
              child: Obx(() => Container(
                    padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            info.mClass,
                            style: TextStyle(
                              fontSize: 16,
                              color: (_schoolVM.selectedMajorlInfoIndex.value
                                          .toInt() !=
                                      index)
                                  ? Colors.grey
                                  : Colors.black,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            info.lClass,
                            style: TextStyle(
                                fontSize: 13,
                                color: (_schoolVM.selectedMajorlInfoIndex.value
                                            .toInt() !=
                                        index)
                                    ? Colors.grey
                                    : Colors.black),
                          ),
                        ),
                        Divider()
                      ],
                    ),
                  )),
            );
          },
        );
      }),
    );
  }
}
