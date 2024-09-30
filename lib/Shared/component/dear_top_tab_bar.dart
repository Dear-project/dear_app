import 'package:dear_app/Shared/theme/dear_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TopBarType { Discover, Chat, Community, Professor }

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
        return [Tab(text: "교수님 목록"), Tab(text: "대학교 목록"), Tab(text: "찜한 목록")];
      case TopBarType.Chat:
        return [Tab(text: "전체"), Tab(text: "차단한 사람 보기")];
      case TopBarType.Community:
        return [Tab(text: "커뮤니티"), Tab(text: "내 작성글 보기")];
      case TopBarType.Professor:
        return [Tab(text: "임시")];
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
        splashFactory: NoSplash.splashFactory,
        isScrollable: true,
        controller: widget.tabController,
        overlayColor: MaterialStateColor.resolveWith((states) => Colors.white),
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