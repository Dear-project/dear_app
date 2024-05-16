import 'package:dear_app/Feature/Main/Chat/ui/chatView.dart';
import 'package:dear_app/Feature/Main/Chat/ui/inChatView.dart';
import 'package:dear_app/Shared/theme/dearColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DearTopTabBar extends StatefulWidget implements PreferredSizeWidget {
  DearTopTabBar({required this.tabController ,super.key});

  TabController tabController;

  @override
  State<DearTopTabBar> createState() => _DearTopTabBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _DearTopTabBarState extends State<DearTopTabBar> {
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
        padding: EdgeInsets.symmetric(horizontal: 27),
        isScrollable: true,
        controller: widget.tabController,
        tabAlignment: TabAlignment.start,
        indicatorColor: DearColors.main,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: DearColors.main,
        labelStyle: TextStyle(
            fontFamily: "Pretendard",
            fontWeight: FontWeight.w600,
            fontSize: 17),
        tabs: const [
          Tab(text: "전체"),
          Tab(text: "차단한 사람 보기"),
        ],
      ),
    );
  }
}
