import 'package:dear_app/Feature/Main/Discover/model/matching_response.dart';
import 'package:dear_app/Feature/Main/Discover/view_model/controller/discover_view_model.dart';
import 'package:dear_app/Feature/Main/Shared/component/matching_request_cell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ChatRequestView extends StatefulWidget {
  @override
  State<ChatRequestView> createState() => _ChatRequestViewState();
}

class _ChatRequestViewState extends State<ChatRequestView> {
  final _discoverVM = Get.put(DiscoverViewModel());

  @override
  void initState() {
    super.initState();
    _discoverVM.matchingPC.addPageRequestListener((pageKey) {
      _discoverVM.getMatchingRequest(pageKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: PagedListView<int, MatchingResponse>(
            shrinkWrap: false,
            pagingController: _discoverVM.matchingPC,
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (BuildContext context, item, index) {
                return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26, vertical: 7),
                    child: MatchingRequestCell(
                      model: item,
                    ));
              },
            )),
      );
  }
}
