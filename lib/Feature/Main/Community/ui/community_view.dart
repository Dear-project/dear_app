import 'package:dear_app/Feature/Main/Community/component/community/community_cell.dart';
import 'package:dear_app/Feature/Main/Community/view_model/controller/community_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunityView extends StatelessWidget {
  CommunityView({super.key});

  final _communityVM = Get.put(CommunityViewModel());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
          child: Obx(
                () => Column(
              children: [
                ...List.generate(_communityVM.communityList.value!.length, (index) {
                  if (_communityVM.communityList.value![index].title.trim() != "") {
                    return Column(
                      children: [
                        CommunityCell(
                            model: _communityVM.communityList.value![index],
                            id: _communityVM.communityList.value![index].id),
                        SizedBox(
                          height: 6,
                        )
                      ],
                    );
                  }
                  else {
                    return Container();
                  }
                }),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          )),
    );
  }
}