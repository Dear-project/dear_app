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
        child: Column(
          children: [
            ...List.generate(
                _communityVM.model.value!.length,
                (index) => Column(
                      children: [
                        CommunityCell(model: _communityVM.model.value![index]),
                        SizedBox(
                          height: 6,
                        )
                      ],
                    )),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
