import 'package:dear_app/Feature/Main/Chat/ui/chatView.dart';
import 'package:dear_app/Feature/Main/Chat/ui/inChatView.dart';
import 'package:dear_app/Shared/theme/dearColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum TopBarType { Discover, Chat }

class DearTopTabBar extends StatefulWidget implements PreferredSizeWidget {
  DearTopTabBar({required this.tabController, required this.topBarType, super.key});

  TabController tabController;

  TopBarType topBarType;

  @override
  State<DearTopTabBar> createState() => _DearTopTabBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _DearTopTabBarState extends State<DearTopTabBar> {

  List<Widget> getTabs() {
    switch (widget.topBarType) {
      case TopBarType.Discover:
        return [Tab(text: "교수님 목록"), Tab(text: "찜한 교수님"), Tab(text: "순위 보기")];
      case TopBarType.Chat:
        return [Tab(text: "전체"), Tab(text: "차단한 사람 보기")];
    }
  }

  @override
  void dispose() {
    widget.tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _tabBar();
  }

  Widget _tabBar() {
    return SizedBox(
      height: 40,
      child: TabBar(
        // padding: EdgeInsets.symmetric(horizontal: 27),
        isScrollable: true,
        controller: widget.tabController,
        tabAlignment: TabAlignment.center,
        indicatorColor: DearColors.main,
        labelColor: DearColors.main,
        labelPadding: EdgeInsets.symmetric(horizontal: 26),
        labelStyle: TextStyle(
            fontFamily: "Pretendard",
            fontWeight: FontWeight.w600,
            fontSize: 17),
        tabs: getTabs(),
      ),
    );
  }
}
