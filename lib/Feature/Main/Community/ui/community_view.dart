import 'package:dear_app/Feature/Main/Community/component/community/community_cell.dart';
import 'package:dear_app/Feature/Main/Community/view_model/controller/community_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunityView extends StatefulWidget {
  CommunityView({super.key});

  @override
  State<CommunityView> createState() => _CommunityViewState();
}

class _CommunityViewState extends State<CommunityView> {
  final _communityVM = Get.put(CommunityViewModel());

  @override
  void initState() {
    super.initState();
    _communityVM.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
          child: Obx(
                () =>
                Column(
                  children: [
                    ...List.generate(
                        _communityVM.communityList.value!.length, (index) {
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