
import 'package:dear_app/feature/main/community/ui/main_community_view.dart';
import 'package:dear_app/feature/main/profile/ui/profile_view.dart';
import 'package:dear_app/shared/component/dear_tab_view.dart';
import 'package:dear_app/shared/model/dearTabViewItem.dart';
import 'package:dear_app/shared/theme/dear_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dear_app/feature/main/chat/ui/chat_view.dart';
import 'package:dear_app/feature/main/Home/ui/home_view.dart';
import 'package:dear_app/feature/main/Discover/ui/discover_view.dart';
import 'package:dear_app/feature/main/profile/ui/profile_view.dart';

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  var _index = 0;

  final List<Widget> _pages = [
    HomeView(),
    ChatView(),
    DiscoverView(),
    MainCommunityView(),
    ProfileView()
  ];

  final List<DearTabViewItem> _items = [
    DearTabViewItem(
        icon: DearIcons.home,
        toggle: true
    ),
    DearTabViewItem(
        icon: DearIcons.chat
    ),
    DearTabViewItem(
      icon: DearIcons.inventory,
    ),
    DearTabViewItem(
      icon: DearIcons.people,
    ),
    DearTabViewItem(
        icon: DearIcons.my
    )
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
