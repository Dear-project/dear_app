import 'package:dear_app/Shared/theme/dear_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TopBarType { Discover, Chat, Community }

class DearTopTabBar extends StatefulWidget implements PreferredSizeWidget {
  DearTopTabBar(
      {required this.tabController, required this.topBarType, super.key});

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
      case TopBarType.Community:
        return [Tab(text: "커뮤니티"), Tab(text: "멘토링"), Tab(text: "랭킹")];
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
        indicatorSize: widget.topBarType == TopBarType.Community
            ? TabBarIndicatorSize.tab
            : TabBarIndicatorSize.label,
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
