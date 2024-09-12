import 'dart:io';

import 'package:dear_app/Feature/Main/Chat/ui/chat_view.dart';
import 'package:dear_app/Feature/Main/Chat/view_model/chat_view_model.dart';
import 'package:dear_app/Feature/Main/Discover/ui/discover_view.dart';
import 'package:dear_app/Feature/Main/Home/ui/home_view.dart';
import 'package:dear_app/Feature/Main/Community/ui/main_community_view.dart';
import 'package:dear_app/Feature/Main/Home/view_model/controller/home_view_model.dart';
import 'package:dear_app/Feature/Main/Profile/ui/profile_view.dart';
import 'package:dear_app/Feature/Main/Profile/view_model/controller/profile_view_model.dart';
import 'package:dear_app/Feature/Main/Community/view_model/controller/community_view_model.dart';
import 'package:dear_app/Shared/component/dear_tab_view.dart';
import 'package:dear_app/Shared/model/dear_tab_view_item.dart';
import 'package:dear_app/Shared/theme/dear_icons.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final _profileVM = Get.put(ProfileViewModel());
  final _homeVM = Get.put(HomeViewModel());
  final _communityVM = Get.put(CommunityViewModel());
  final _chatVM = Get.put(ChatViewModel());

  var _index = 0;

  @override
  void initState() {
    super.initState();
    _profileVM.getProfile();
    _homeVM.getBanner();
    _communityVM.getPosts();
    _communityVM.getPostsMy();

    _initFirebaseMessage();
    _requestPermissionForIOS();
  }

  Future<void> _initFirebaseMessage() async {
    // Get inicial message if the application
    // has been opened from a terminated state.
    final message = await FirebaseMessaging.instance.getInitialMessage();
    // Check notification data
    if (message != null) {
      // Debug
      debugPrint('getInitialMessage() -> data: ${message.data}');
      // Handle notification data
      await _handleNotificationClick(message.data);
    }

    // Returns a [Stream] that is called when a user
    // presses a notification message displayed via FCM.
    // Note: A Stream event will be sent if the app has
    // opened from a background state (not terminated).
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      // Debug
      debugPrint('onMessageOpenedApp() -> data: ${message.data}');
      // Handle notification data
      await _handleNotificationClick(message.data);
    });

    // Listen for incoming push notifications
    FirebaseMessaging.onMessage.listen((RemoteMessage? message) async {
      // Debug
      debugPrint('onMessage() -> data: ${message?.data}');
      // Handle notification data
      await _handleNotificationClick(message?.data);
    });
  }

  Future<void> _handleNotificationClick(Map<String, dynamic>? data) async {

  }

  void _requestPermissionForIOS() async {
    if (Platform.isIOS) {
      await FirebaseMessaging.instance.requestPermission();
    }
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
