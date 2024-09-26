import 'package:dear_app/Feature/Main/Community/component/community/community_cell.dart';
import 'package:dear_app/Feature/Main/Community/view_model/controller/community_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyPostView extends StatefulWidget {
  MyPostView({super.key});

  @override
  State<MyPostView> createState() => _MyPostViewState();
}

class _MyPostViewState extends State<MyPostView> {
  final _communityVM = Get.put(CommunityViewModel());

  @override
  void initState() {
    super.initState();
    _communityVM.getPostsMy();
  }


  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
          child: Obx(
                () => Column(
              children: [
                ...List.generate(_communityVM.myModel.value!.length, (index) {
                  if (_communityVM.myModel.value![index].title.trim() != "") {
                    return Column(
                      children: [
                        CommunityCell(
                            model: _communityVM.myModel.value![index],
                            id: _communityVM.myModel.value![index].id),
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
          ),
        )
    );
  }
}