import 'dart:io';

import 'package:dear_app/Feature/Main/Chat/ui/chat_view.dart';
import 'package:dear_app/Feature/Main/Chat/view_model/chat_view_model.dart';
import 'package:dear_app/Feature/Main/Discover/ui/discover_view.dart';
import 'package:dear_app/Feature/Main/Discover/view_model/controller/discover_view_model.dart';
import 'package:dear_app/Feature/Main/Home/ui/home_view.dart';
import 'package:dear_app/Feature/Main/Community/ui/main_community_view.dart';
import 'package:dear_app/Feature/Main/Home/view_model/controller/home_view_model.dart';
import 'package:dear_app/Feature/Main/Profile/ui/profile_view.dart';
import 'package:dear_app/Feature/Main/Profile/view_model/controller/profile_view_model.dart';
import 'package:dear_app/Feature/Main/Community/view_model/controller/community_view_model.dart';
import 'package:dear_app/Shared/controller/user_role_controller.dart';
import 'package:dear_app/Shared/component/dear_tab_view.dart';
import 'package:dear_app/Shared/model/dear_tab_view_item.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final _profileVM = Get.put(ProfileViewModel());
  final _discoverVM = Get.put(DiscoverViewModel());
  final _homeVM = Get.put(HomeViewModel());
  final _communityVM = Get.put(CommunityViewModel());
  final _chatVM = Get.put(ChatViewModel());

  final _roleController = UserRoleController.shared;

  var _index = 0;

  @override
  void initState() {
    super.initState();
    _profileVM.getProfile();
    _discoverVM.getProfessor();
  }


  final List<Widget> _pages = [
    HomeView(),
    ChatView(),
    DiscoverView(),
    MainCommunityView(),
    ProfileView()
  ];

  final List<DearTabViewItem> _items = [
    DearTabViewItem(icon: DearIcons.home, toggle: true),
    DearTabViewItem(icon: DearIcons.chat),
    DearTabViewItem(
      icon: DearIcons.inventory,
    ),
    DearTabViewItem(
      icon: DearIcons.people,
    ),
    DearTabViewItem(icon: DearIcons.my)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_index],
        extendBody: true,
        bottomSheet: BottomAppBar(
          elevation: 0,
          height: 60 + MediaQuery.of(context).padding.bottom,
          color: Colors.transparent,
          padding: EdgeInsets.zero,
          child: DearTabView(
            items: _items,
            onClick: (value) {
              setState(() {
                _index = value;
              });
            },
          ),
        ));
  }
}