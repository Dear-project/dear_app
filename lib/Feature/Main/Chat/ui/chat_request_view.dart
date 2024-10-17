import 'package:dear_app/Feature/Main/Discover/view_model/controller/discover_view_model.dart';
import 'package:dear_app/Feature/Main/Shared/component/matching_request_cell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRequestView extends StatefulWidget {
  @override
  State<ChatRequestView> createState() => _ChatRequestViewState();
}

class _ChatRequestViewState extends State<ChatRequestView> {
  final _discoverVM = Get.put(DiscoverViewModel());

  @override
  void initState() {
    super.initState();
    _discoverVM.getMatchingRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        children: [
          MatchingRequestCell()
        ],
      ),
    );
  }
}