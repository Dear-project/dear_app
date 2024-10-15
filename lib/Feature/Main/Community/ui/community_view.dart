import 'package:dear_app/Feature/Main/Community/component/community/community_cell.dart';
import 'package:dear_app/Feature/Main/Community/model/community_response.dart';
import 'package:dear_app/Feature/Main/Community/view_model/controller/community_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

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
    _communityVM.pagingController.addPageRequestListener((pageKey) {
      _communityVM.getPosts(pageKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: PagedListView<int, CommunityResponse>.separated(
        shrinkWrap: false,
        pagingController: _communityVM.pagingController,
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (BuildContext context, item, index) {
            return CommunityCell(model: item);
          },
        ),
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 6);
        },
      ),
    );
  }
}
